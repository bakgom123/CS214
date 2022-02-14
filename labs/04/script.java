Script started on 2022-02-02 09:57:00-05:00 [TERM="xterm-256color" TTY="/dev/pts/3" COLUMNS="142" LINES="12"]
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ javac -deprecation LogTable.java[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[15Pcat[C[C[C[C[C[C[C[C[C[C[C[C[C[C
/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 ********************************************************/
import java.util.Scanner; 		// Get input
import java.lang.Math;             // For logarithm

class LogTable{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To display a table of logarithms,");
    System.out.println("enter the start, stop and increment values: ");
    double start, stop, increment;
    start = keyboard.nextDouble();
    stop = keyboard.nextDouble();
    increment = keyboard.nextDouble();

    //Replace this line with a while loop to generate the table of logs
    double count = 0;
    while (start <= stop){
      count = start;
      System.out.printf("The logarithm of %f is %f\n", count, Math.log10(count));
      start = start + increment;
    }
  }
}

]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ cat LogTable.java[15@javac -deprecation[C[C[C[C[C[C[C[C[C[C[C[C[C[C
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ java LogTable
To display a table of logarithms,
enter the start, stop and increment values: 
1
2
0.5
The logarithm of 1.000000 is 0.000000
The logarithm of 1.500000 is 0.176091
The logarithm of 2.000000 is 0.301030
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ exit

Script done on 2022-02-02 09:57:24-05:00 [COMMAND_EXIT_CODE="0"]
