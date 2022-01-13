#include <jni.h>


JNIEXPORT jstring JNICALL
Java_danbroid_kipfs_jni_KIPFS_hello(JNIEnv *env, jclass clazz) {
  const char *msg = "Hello World from jni!";
  return (*env)->NewStringUTF(env, msg);
}