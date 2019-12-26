package myerror;

public class MyErrExample  extends Exception{
    int id;

    public MyErrExample(int x){
        id = x;
    }

    public String toString(){
        return "Fatal Error Detected. Check your codes.";
    }
}
