private val log = danbroid.logging.configure("TEST", coloured = true)

fun main() {
  println("Hello World")

  val msg = gobind.GetMessage();
  println("msg: $msg")

}