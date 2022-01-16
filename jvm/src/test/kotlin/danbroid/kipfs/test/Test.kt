package danbroid.kipfs.test

import danbroid.kipfs.jni.KIPFS
import danbroid.kipfs.jni.NativeLoader
import org.junit.Test

class Test {
  companion object {
    val log = danbroid.logging.configure("TEST", coloured = true)

    init {
      NativeLoader.loadLibrary(Test::class.java.classLoader)
    }
  }

  @Test
  fun test() {
    log.info("test1()")
    KIPFS.hello().also {
      log.debug("hello() = $it")
    }
    KIPFS.hello().also {
      log.debug("hello() = $it")
    }

    KIPFS.dagCid("\"Hello World\"").also {
      log.debug("dagCid() = $it")
    }
  }
}