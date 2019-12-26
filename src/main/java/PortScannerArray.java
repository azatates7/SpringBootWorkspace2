import java.awt.*;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Scanner;

public class PortScannerArray {
    private static ArrayList<Integer> openports = new ArrayList<Integer>();
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.print("Type a host name : ");
        String host = keyboard.nextLine();
                for(int i = 0; i <= 65535; i++ ){
                    try{
                        System.out.println("\nPort " + i + " scanning");
                        InetSocketAddress socketAddress = new InetSocketAddress(host, i);
                        Socket s = new Socket();
                        s.connect(socketAddress, 500);
                        Toolkit.getDefaultToolkit().beep();
                        openports.add(i);
                        s.close();
                    }
                    catch (IOException ex) {
                        System.out.println(i + " . Port not running!");
                    }
                }
                System.out.println("Opened Ports : \n"+openports);
        keyboard.close();
    }
}