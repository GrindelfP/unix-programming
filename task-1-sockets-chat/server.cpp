#include <iostream>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <string>
#include <signal.h>
#include <cstdlib>
#include <cstring>
#include <sys/wait.h>

const char* SOCKET_PATH = "./echo.server";
int server_fd = -1;

void signal_handler(int signum) {
    if (signum == SIGINT) {
        std::cout << "Shutdown signal received. Closing socket..." << std::endl;
        if (server_fd != -1) {
            close(server_fd);
            unlink(SOCKET_PATH);
        }
        exit(0);
    }
}

void child_signal_handler(int signum) {
    if (signum == SIGINT) {
        std::cout << "Client shutdown" << std::endl;
        exit(0);
    }
}

int main() {
    // 1. Create socket
    server_fd = socket(AF_UNIX, SOCK_STREAM, 0);
    if (server_fd == -1) {
        perror("socket");
        return 1;
    }
    std::cout << "Create socket, ID = " << server_fd << std::endl;

    // 2. Declare server address
    struct sockaddr_un server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, SOCKET_PATH, sizeof(server_addr.sun_path) - 1);

    // Remove existing socket file
    unlink(SOCKET_PATH);

    // 4. Bind socket to address
    if (bind(server_fd, (struct sockaddr*)&server_addr, sizeof(server_addr)) == -1) {
        perror("bind");
        close(server_fd);
        return 1;
    }
    std::cout << "socket bounded..." << std::endl;

    // 5. Listen for connections
    if (listen(server_fd, 5) == -1) {
        perror("listen");
        close(server_fd);
        unlink(SOCKET_PATH);
        return 1;
    }
    std::cout << "Socket listened..." << std::endl;

    // Set up signal handler for SIGINT in the parent process
    struct sigaction sa;
    sa.sa_handler = signal_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    if (sigaction(SIGINT, &sa, nullptr) == -1) {
        perror("sigaction");
        close(server_fd);
        unlink(SOCKET_PATH);
        return 1;
    }

    // 6. Accept connections in a loop
    while (true) {
        struct sockaddr_un client_addr;
        socklen_t client_addr_len = sizeof(client_addr);
        int client_fd = accept(server_fd, (struct sockaddr*)&client_addr, &client_addr_len);
        if (client_fd == -1) {
            perror("accept");
            continue; // Continue listening for new clients
        }
        std::cout << "\nNew client comming..." << std::endl;

        // Create a child process to handle the client
        pid_t pid = fork();
        if (pid == -1) {
            perror("fork");
            close(client_fd);
        } else if (pid == 0) { // Child process
            // Close the server socket in the child
            close(server_fd);

            // Set up signal handler for SIGINT in the child process
            struct sigaction child_sa;
            child_sa.sa_handler = child_signal_handler;
            sigemptyset(&child_sa.sa_mask);
            child_sa.sa_flags = 0;
            if (sigaction(SIGINT, &child_sa, nullptr) == -1) {
                perror("sigaction in child");
                close(client_fd);
                exit(1);
            }

            // Infinite loop for receiving and sending messages
            while (true) {
                char buffer[256];
                ssize_t bytes_received = recv(client_fd, buffer, sizeof(buffer) - 1, 0);
                if (bytes_received == -1) {
                    perror("recv");
                    break;
                } else if (bytes_received == 0) {
                    std::cout << "Client disconnected." << std::endl;
                    break;
                } else {
                    buffer[bytes_received] = '\0';
                    std::cout << "Recieve from client: " << buffer << std::endl;
                    std::cout << "message length = " << bytes_received << std::endl;
                    std::string response = "Echo - " + std::string(buffer);
                    ssize_t bytes_sent = send(client_fd, response.c_str(), response.length(), 0);
                    if (bytes_sent == -1) {
                        perror("send");
                        break;
                    }
                    std::cout << "Send to client: " << response << std::endl;
                }
            }
            close(client_fd);
            exit(0);
        } else { // Parent process
            // Close the client socket in the parent (parent doesn't communicate directly)
            close(client_fd);
            // Reap zombie children
            wait(nullptr);
        }
    }

    // This part will not be reached due to the infinite loop
    close(server_fd);
    unlink(SOCKET_PATH);
    return 0;
}
