import gobind.accept_fun
import gobind.supply_fun
import kotlinx.cinterop.*

private val log = danbroid.logging.configure("TEST", coloured = true)

fun main() {

  log.warn("msg: ${gobind.GetMessage().copyToString()}")


  val json = "\"Hello World\""
  log.info("CID: ${gobind.CID(json.cstr).copyToString()}")


  val cFunctionPointer = staticCFunction<Int, Int> { it + 1 }
  accept_fun(cFunctionPointer)
  log.trace("done that bit")

  val funFromC = supply_fun() ?: error("No function is returned")

  funFromC(22).also {
    log.trace("funFromC = $it")
  }

  gobind.CreateShell("/ip4/192.168.1.4/tcp/5001".cstr)

  log.info(
    "IPFS ID: ${
      gobind.IPFS_ID().copyToString()
    }"
  )


  log.debug("finished")
}

fun CPointer<ByteVar>?.copyToString(): String =
  if (this != null) {
    val s = this.toKString()
    gobind.Free(this)
    s
  } else "null"