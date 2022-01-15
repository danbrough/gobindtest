#include <jni.h>

#include "libgojni.h"
#include <jni.h>

JNIEXPORT jstring JNICALL
Java_danbroid_kipfs_jni_KIPFS_hello(JNIEnv *env, jclass clazz) {
  char * msg = KGetMessage();
  jstring s = (*env)->NewStringUTF(env, msg);
  free(msg);
  return s;
}



JNIEXPORT jstring JNICALL
Java_danbroid_kipfs_jni_KIPFS_dagCid(JNIEnv *env, jclass clazz,jstring json) {
  const char *jsonC = (*env)->GetStringUTFChars(env,json, NULL);//Java String to C Style string
  char * msg = KCID((char*)jsonC);

  (*env)->ReleaseStringUTFChars(env,json, jsonC);
  jstring s = (*env)->NewStringUTF( env,msg);
  free(msg);
  return s;
}
