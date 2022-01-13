import gobind.accept_fun
import gobind.free
import gobind.supply_fun
import kotlinx.cinterop.*
import platform.posix.getpid
import platform.posix.sleep
import platform.posix.usleep

private val log = danbroid.logging.configure("TEST", coloured = true)

fun main() {

  log.warn("msg: ${gobind.KGetMessage().copyToString()}")


  val json = "\"Hello World\""
  log.info("CID: ${gobind.KCID(json.cstr).copyToString()}")


  val cFunctionPointer = staticCFunction<Int, Int> { it + 1 }
  accept_fun(cFunctionPointer)
  log.trace("done that bit")

  val funFromC = supply_fun() ?: error("No function is returned")

  funFromC(22).also {
    log.trace("funFromC = $it")
  }

  gobind.KCreateShell("/ip4/192.168.1.4/tcp/5001".cstr)

  log.info("IPFS ID: ${gobind.KIpfsID().copyToString()}")

  log.trace("PID: ${getpid()}")

  Platform.isMemoryLeakCheckerActive = true
  log.warn("debug binary: ${Platform.isDebugBinary} mem leak checker active: ${Platform.isMemoryLeakCheckerActive}")

  sleep(4)
  var n = 0
  while (true) {
    gobind.KBigString(102400)?.copyToString()
    log.trace("${n++}")
    usleep(1000)
  }
}

fun CPointer<ByteVar>?.copyToString(): String =
  this?.toKString()?.also {
    //gobind.KFree(this)
   free(this)
  } ?: "null"
