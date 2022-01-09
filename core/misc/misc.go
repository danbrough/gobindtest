package misc

import (
  //"Java/java/lang/System"
  "time"
)

type Printer interface {
  Print(msg string)
}

func test(data []int8) {
  //	t := System.CurrentTimeMillis()
  //println("T is", t)
  for _, b := range data {
    println("B is", b)
  }
}

func Test2(data []byte) {
  var data2 []int8
  data2 = make([]int8, len(data))
  for i, b := range data {
    data2[i] = int8(b)
  }
  test(data2)
}

func TestPrinter(printer Printer) {
  msg := GetMessage()
  printer.Print("Printing message: " + msg)
}

func GetMessage() string {
  //location, _ := time.LoadLocation("NZ")

  t := time.Now()
  msg := t.Local().Format("15:04:05 2006/01/02")
  return "The time is " + msg
}
