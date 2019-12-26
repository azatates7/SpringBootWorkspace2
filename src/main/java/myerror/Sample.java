package myerror;

public class Sample {
    static void number(int a) throws MyErrExample {
        if(a > 200){
            throw new MyErrExample(a);
        }
        System.out.println("No Found Any Error");

    }
    public static  void main(String[] args){
        try{
            number(200);
            System.out.println("--------------------");
            number(400);
        }
        catch(MyErrExample e){
            System.out.println(e);
        }
    }
}
