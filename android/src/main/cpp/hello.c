#include <jni.h>

#include "libgobindtest.h"

JNIEXPORT jstring JNICALL
Java_danbroid_kipfs_jni_KIPFS_hello(JNIEnv *env, jclass clazz) {
  const char *msg = "Hello World from jni!";
  char * msg2 = KGetMessage();
  printf("The message is %s",msg2);
  return (*env)->NewStringUTF(env, msg2);
}