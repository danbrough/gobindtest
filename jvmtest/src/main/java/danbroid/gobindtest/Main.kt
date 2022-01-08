package danbroid.gobindtest

import go.bindtest.hello.Hello


class Main {
  companion object {
    private val log = danbroid.logging.configure("TEST", coloured = true)

    init {
      NativeLoader.loadLibrary(Main::class.java.classLoader)
    }

    @JvmStatic
    fun main(args: Array<String>) {
      log.info("running main")
      val msg = Hello.getMessage()
      log.info("THe message is $msg")
    }
  }
}