#include <jni.h>

#include "libgojni.h"

JNIEXPORT jstring JNICALL
Java_danbroid_kipfs_jni_KIPFS_hello(JNIEnv *env, jclass clazz) {
  char * msg = KGetMessage();
  return (*env)->NewStringUTF(env, msg);
}