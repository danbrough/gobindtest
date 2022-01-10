#include "libgobindtest.h"

#include <stdio.h>

int main(void){
	printf("Hello Wolrd\n");
	char *s = GetMessage();
	printf("The message is %s\n",s);
	printf("CID: %s\n",CID("\"Hello World\""));
	CreateShell("/ip4/192.168.1.4/tcp/5001");
	printf("The ID is %s\n",ID());
	return 0;
}

