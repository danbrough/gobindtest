#include "libgobindtest.h"

#include <stdio.h>

int main(void){
	printf("Hello Wolrd\n");
	char *s = GetMessage();
	printf("The message is %s\n",s);
	Free(s);
	char *cid = CID("\"Hello World\"");
	printf("CID: %s\n",cid);
	Free(cid);
	CreateShell("/ip4/192.168.1.4/tcp/5001");
	char *id = IPFS_ID();
	printf("The ID is %s\n",id);
	Free(id);
	Free(NULL);
	return 0;
}

