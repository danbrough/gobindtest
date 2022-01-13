package danbroid.kipfs.jni

import android.support.test.InstrumentationRegistry
import android.support.test.runner.AndroidJUnit4

import org.junit.Test
import org.junit.runner.RunWith

import org.junit.Assert.*

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {

  companion object {
    val log = danbroid.logging.configure("TEST", coloured = true)
  }

  @Test
  fun test1() {
    // Context of the app under test.
    log.info("test1()")
    val appContext = InstrumentationRegistry.getInstrumentation().targetContext

    KIPFS.hello().also {
      log.info("HELLO SAYS: $it")
    }

  }
}