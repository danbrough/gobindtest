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

	 char * repoDir = "/home/dan/.kipfs_tests/repo";

	if (!KRepoIsInitialized(repoDir)){
	    printf("Repo at %s is not initialized.\n",repoDir);
	    KInitRepo(repoDir);
	}else {
	    printf("Repo at %s is initialized.\n",repoDir);
	}
	return 0;
}

