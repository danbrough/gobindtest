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
      println("loading gojni")
      System.loadLibrary("gojni")
      println("loading kipfs")
      System.loadLibrary("kipfs")
      println("finished loading")
    }


    @JvmStatic
    external fun hello(): String
  }
}