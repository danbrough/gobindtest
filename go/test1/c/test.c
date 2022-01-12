#include "libgobindtest.h"

#include <stdio.h>

int main(void){
	char *s = kGetMessage();
	printf("The message is %s\n",s);
	kFree(s);
	char *cid = kCID("\"Hello World\"");
	printf("CID: %s\n",cid);
	kFree(cid);
	kCreateShell("/ip4/192.168.1.4/tcp/5001");
	char *id = kIpfsID();
	printf("The ID is %s\n",id);
	kFree(id);
	return 0;
}

