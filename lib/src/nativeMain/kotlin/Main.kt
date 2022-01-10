import gobind.accept_fun
import gobind.supply_fun
import kotlinx.cinterop.cstr
import kotlinx.cinterop.invoke
import kotlinx.cinterop.staticCFunction
import kotlinx.cinterop.toKString

private val log = danbroid.logging.configure("TEST", coloured = true)

fun main() {
  val msg = gobind.GetMessage()?.toKString();
  log.warn("msg: $msg")

  val json = "\"Hello World\""
  val cid = gobind.CID(json.cstr)?.toKString()
  log.info("CID: $cid")


  val cFunctionPointer = staticCFunction<Int, Int> { it + 1 }
  accept_fun(cFunctionPointer)
  log.trace("done that bit")

  val funFromC = supply_fun() ?: error("No function is returned")

  funFromC(22).also {
    log.trace("funFromC = $it")
  }

  gobind.CreateShell("/ip4/192.168.1.4/tcp/5001".cstr)

  log.info("IPFS ID: ${gobind.IPFS_ID()?.toKString()}")


  log.debug("finished")
}