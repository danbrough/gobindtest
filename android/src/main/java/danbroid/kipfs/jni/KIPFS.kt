package danbroid.kipfs.jni

class KIPFS {


  companion object {

    // Used to load the 'jni' library on application startup.
    init {
      println("loading gojni")
      System.loadLibrary("gojni")
/*      println("loading kipfs")
      System.loadLibrary("kipfs")*/
      println("finished loading")
    }


    @JvmStatic
    external fun hello(): String

    @JvmStatic
    external fun dagCid(json:String): String
  }
}