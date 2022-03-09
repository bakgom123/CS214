Script started on 2022-03-05 02:42:22-05:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="256" LINES="12"]
]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ cat Root.java
/* Root.java computes the roots of the quadratic equation. (ax^2+bx+c)
 *
 * Created by: David Yoo (gy24)
 * Date: Mar 5, 2022
 ********************************************************/
import java.util.Scanner; 		// Get input
import java.lang.Math;

public class Root{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);

    System.out.println("Please enter a: ");
    double a = keyboard.nextDouble();

    System.out.println("Please enter b: ");
    double b = keyboard.nextDouble();

    System.out.println("Please enter c: ");
    double c = keyboard.nextDouble(); 

    double[] roots = new double[2];
    if(quadraticRoots (a, b, c, roots)) // printing of the roots occur in the main friver program, not in the subprogram
        System.out.printf("%f, %f\n", roots[0], roots[1]);
  }

// Subprogram that computes the roots
static boolean quadraticRoots (double a, double b, double c, double[] roots){ 
    if(a != 0){
        double arg = Math.pow(b, 2.0) - (4*a*c);
        if(arg >= 0){
            roots[0] = (-b + Math.sqrt(arg)) / (2*a);
            roots[1] = (-b - Math.sqrt(arg)) / (2*a);
            return true;
        }
        else {
            System.out.println("b^2 - 4ac is negative!");
            roots[0] = roots[1] = 0.0;
            return false;
        }
    }
    else {
        System.out.println("a is zero!");
        roots[0] = roots[1] = 0.0;
        return false;
    }
  }
}]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ javac -deprecation Root.java
]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ java Root
Please enter a: 
1
Please enter b: 
2
Please enter c: 
3
b^2 - 4ac is negative!
]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ java Root
Please enter a: 
1
Please enter b: 
5
Please enter c: 
2
-0.438447, -4.561553
]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ java Root
Please enter a: 
5
Please enter b: 
6
Please enter c: 
5
b^2 - 4ac is negative!
]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ exit

Script done on 2022-03-05 02:43:09-05:00 [COMMAND_EXIT_CODE="0"]
