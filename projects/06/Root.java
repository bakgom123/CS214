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
    if(quadraticRoots (a, b, c, roots))
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
}