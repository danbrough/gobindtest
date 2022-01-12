#include "libgobindtest.h"

#include <stdio.h>

int main(void){
	char *s = KGetMessage();
	printf("The message is %s\n",s);
	KFree(s);
	char *cid = KCID("\"Hello World\"");
	printf("CID: %s\n",cid);
	KFree(cid);
	KCreateShell("/ip4/192.168.1.4/tcp/5001");
	char *id = KIpfsID();
	printf("The ID is %s\n",id);
	KFree(id);
	return 0;
}

