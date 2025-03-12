/*
   _____            _        _   ____  _         _ 
  / ____|          | |      | | |  _ \(_)       | |
 | (___   ___   ___| | _____| |_| |_) |_ _ __ __| |
  \___ \ / _ \ / __| |/ / _ \ __|  _ <| | '__/ _` |
  ____) | (_) | (__|   <  __/ |_| |_) | | | | (_| |
 |_____/ \___/ \___|_|\_\___|\__|____/|_|_|  \__,_|

 Source file for SocketBird server app.
 Created by GrindelfP on 2025-03-12.
*/
#include "sockets.h"

int main(int argc, char** argv) {

	// if (!fork()) {
		int socketID = socket(AF_UNIX, SOCK_STREAM, 0);
		if (socketID < 0) SOCKET_NOT_CREATED_ERROR;
		unlink(SERVER_ECHO_FILE);
		/*struct sockaddr_un saddr;
		saddr.sun_family = AF_UNIX;
		strcpy(saddr.sun_path, SERVER_ECHO_FILE);
		if (bind(socketID, (struct sockaddr*)&saddr, sizeof(saddr)) < 0) { 
			// UNSUCCESS_BIND_ERROR; 
		} 
	    else {  
			SUCCESS_BIND_MESSAGE_WITH(saddr.sun_path); 
		}
		*///print_text("AAAAAAA");
		printf("%s\n", "AA!");
	// }
	return 0;
}

