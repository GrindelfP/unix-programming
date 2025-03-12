/*
   _____            _        _   ____  _         _ 
  / ____|          | |      | | |  _ \(_)       | |
 | (___   ___   ___| | _____| |_| |_) |_ _ __ __| |
  \___ \ / _ \ / __| |/ / _ \ __|  _ <| | '__/ _` |
  ____) | (_) | (__|   <  __/ |_| |_) | | | | (_| |
 |_____/ \___/ \___|_|\_\___|\__|____/|_|_|  \__,_|

 Common header file for SocketBird app.
 Created by GrindelfP on 2025-03-12.
*/

#ifndef sockets_h
#define sockets_h

#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/un.h>
#include <stdlib.h>

#define PAUOLE while(1)
// pau ole means endless
#define STR "%s\n"
#define STRSTR "%s%s\n"

#define print_text(text) printf(STR, text)
#define print_texttext(text1, text2) printf(STRSTR, text1, text2)
#define throw_error(error) fprintf(stderr, STR, error); exit(1)

#define socket_not_created_message_ "Socket was not created!"
#define SOCKET_NOT_CREATED_ERROR throw_error(socket_not_created_message_)
#define unsuccess_bind_message_ "Bind was not successful!"
#define UNSUCCESS_BIND_ERROR throw_error(unsuccess_bind_message_)

#define success_bind_message_ "Succesfull bound with "
#define SUCCESS_BIND_MESSAGE_WITH(path) print_texttext(success_bind_message_, path) 

#define	SERVER_ECHO_FILE "./echo.server"

#endif

