package danbroid.kipfs.jni

class KIPFS {


  companion object {

    // Used to load the 'jni' library on application startup.
    init {
      System.loadLibrary("kipfs")
      println("kipfs loaded")
    }


    @JvmStatic
    external fun hello(): String


    @JvmStatic
    external fun dagCid(json: String): String

    @JvmStatic
    fun main(args: Array<String>) {
      println("Getting hello ..")
      println("HELLO : ${hello()}")
      println("HELLO AGAIN: ${hello()}")
      println("CID: ${dagCid("\"Hello World\"")}")
    }
  }
}
