package danbroid.kipfs.jni;

public class KIPFS {


    public static native String hello();


    public static native String dagCid(String json);


    public static void main(String[] args){
      System.loadLibrary("kipfs");
      System.out.println("Getting hello ..");
      System.out.println("hello() = " + hello());
      System.out.println("hello() = " + hello());
      System.out.println("CID: " + dagCid("\"Hello World\""));
    }
}
