package danbroid.kipfs.jni

class KIPFS {

  /**
   * A native method that is implemented by the 'jni' native library,
   * which is packaged with this application.
   */
  external fun stringFromJNI(): String


  companion object {

    // Used to load the 'jni' library on application startup.
    init {
      System.loadLibrary("kipfs")
    }


    @JvmStatic
    external fun hello(): String
  }
}