package danbroid.kipfs.jni;

public class KIPFS {




    // Used to load the 'jni' library on application startup.
    static {
      System.loadLibrary("kipfs");
    }



    public static native String hello();


    public static native String dagCid(String json);


    public static void main(String[] args){
      System.out.println("Getting hello ..");
      System.out.println("hello() = " + hello());
      System.out.println("hello() = " + hello());
      System.out.println("CID: " + dagCid("\"Hello World\""));
    }
}
