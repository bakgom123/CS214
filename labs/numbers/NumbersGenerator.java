/* NumbersGenerator.java generates N random numbers between 1 and 1000,
 *   where N is a commandline argument.
 *
 * @author Joel Adams, for CS 214 at Calvin College.
 */

import java.io.File;
import java.io.PrintWriter;
import java.io.FileNotFoundException;
import java.util.Random;

public class NumbersGenerator {
   public static void main(String [] args) {
      if (args.length != 1) {
         System.err.println("\n*** Usage: java NumbersGenerator <N>\n");
      }

      long N = Integer.parseInt( args[0] );
      String fileName = "" + N + "numbers.txt";

      PrintWriter pw = null;
      try {
         pw = new PrintWriter(
                        new File( fileName ) );
      } catch ( FileNotFoundException fnfe ) {
        System.err.println("\n*** Unable to open file '" + fileName + "'.");
      }

      pw.println(N);
      pw.println();

      Random random = new Random();
      for (int i = 0; i < N; i++) {
        int number = random.nextInt(100) + 1;
        pw.println(number);
      }

      pw.close();
      System.out.println("\nProcessing complete; results are in '"
                          + fileName +"'.");
   }
} 

