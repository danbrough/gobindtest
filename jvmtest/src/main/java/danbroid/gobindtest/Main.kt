package danbroid.gobindtest

import go.bindtest.misc.Misc
import go.bindtest.misc.Printer


class Main {
  companion object {
    private val log = danbroid.logging.configure("TEST", coloured = true)

    init {
      NativeLoader.loadLibrary(Main::class.java.classLoader)
    }

    @JvmStatic
    fun main(args: Array<String>) {
      log.debug("running main")

      val msg = Misc.getMessage()
      log.info("THe message is $msg")

      val printer = Printer{
        log.warn("DOING PRINT: $it")
      }
      Misc.testPrinter(printer)
    }
  }
}