#include <iostream>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <string>
#include <cstring>
#include <signal.h>

const char* SOCKET_PATH = "./echo.server";
int client_fd = -1;

void signal_handler(int signum) {
    if (signum == SIGINT) {
        std::cout << "\nClient shutdown" << std::endl;
        if (client_fd != -1) {
            close(client_fd);
        }
        exit(0);
    }
}

int main() {
    // 1. Create socket
    client_fd = socket(AF_UNIX, SOCK_STREAM, 0);
    if (client_fd == -1) {
        perror("socket");
        return 1;
    }
    std::cout << "Create socket, ID = " << client_fd << std::endl;

    // 2. Declare server address
    struct sockaddr_un server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, SOCKET_PATH, sizeof(server_addr.sun_path) - 1);

    // 3. Connect to the server socket
    if (connect(client_fd, (struct sockaddr*)&server_addr, sizeof(server_addr)) == -1) {
        perror("connect");
        close(client_fd);
        return 1;
    }
    std::cout << "socket connected..." << std::endl;

    // Set up signal handler for SIGINT
    struct sigaction sa;
    sa.sa_handler = signal_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    if (sigaction(SIGINT, &sa, nullptr) == -1) {
        perror("sigaction");
        close(client_fd);
        return 1;
    }

    // 4. Send and receive messages in a loop
    while (true) {
        std::cout << ">";
        std::string message;
        std::getline(std::cin, message);

        if (message.empty()) {
            break;
        }

        // Send message to the server
        ssize_t bytes_sent = send(client_fd, message.c_str(), message.length(), 0);
        if (bytes_sent == -1) {
            perror("send");
            break;
        }
        std::cout << "Send to server: " << message << std::endl;
        std::cout << "msg length = " << bytes_sent << std::endl;

        // Receive response from the server
        char buffer[256];
        ssize_t bytes_received = recv(client_fd, buffer, sizeof(buffer) - 1, 0);
        if (bytes_received == -1) {
            perror("recv");
            break;
        } else if (bytes_received == 0) {
            std::cout << "Server disconnected." << std::endl;
            break;
        } else {
            buffer[bytes_received] = '\0';
            std::cout << "Recieve from server: " << buffer << std::endl;
        }
    }

    // Close the socket
    close(client_fd);
    return 0;
}
