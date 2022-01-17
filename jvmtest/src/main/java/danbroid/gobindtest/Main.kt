package danbroid.gobindtest

import danbroid.kipfs.jni.KIPFS
import danbroid.kipfs.jni.NativeLoader


class Main {
  companion object {
    private val log = danbroid.logging.configure("TEST", coloured = true)

    init {
      //NativeLoader.loadLibrary(Main::class.java.classLoader)
      NativeLoader.loadLibrary(Main::class.java.classLoader)
    }

    @JvmStatic
    fun main(args: Array<String>) {
      log.debug("running main")

      log.debug("hello() = ${KIPFS.hello()}")
      log.info("hello() = ${KIPFS.dagCid("\"Hello World\"")}")

    }
  }
}