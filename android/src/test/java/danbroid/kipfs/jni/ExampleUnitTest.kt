package danbroid.kipfs.jni

import org.junit.Test

import org.junit.Assert.*

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */


class ExampleUnitTest {
  @Test
  fun addition_isCorrect() {
    assertEquals(4, 2 + 2)
  }

  @Test
  fun test() {
    println("Running test..")
    KIPFS.hello().also {
      println("Hello returned $it")
    }

    KIPFS.CID("\"Hello World\"").also {
      println("CID: $it")
    }
  }
}