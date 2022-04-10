Script started on 2022-04-09 19:11:03-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="151" LINES="9"]
]0;gy24@gold12: ~/cs214/labs/12/java[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/java[00m$ cat threaded[K[K[K[K[K[K[K[KThreaded_Array_Sum.java
/* Threaded_Array_Sum.java sums the integers in a file using an array with different numbers of threads.
 *
 * Usage: java -Xint Threaded_Array_Sum <fileName>
 *
 * Input: the name of the input file
 *         (entered on the command-line).
 * Precondition: the first line of the file is the number
 *                of (other) numbers in the file.
 * Output: the sum of the other numbers in the file
 *          and how long it took to compute that sum.
 *
 * Begun by: Prof. Adams for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Apr 9, 2022
 */

import java.util.Scanner;                   // convenient I/O
import java.io.File;                        // file I/O
import java.io.FileNotFoundException;       // file exception
import java.lang.System;                    // nanoTime()

public class Threaded_Array_Sum {

  public static void main(String [] args) {
    Threaded_Array_Sum me = new Threaded_Array_Sum(args);
     me.run();
  }

  /* constructor
   * @param: args, an array of Strings
   * Precondition: args.length == 1 &&
   *                args[0] is the name of an input file
   *                 whose first line is N, an integer
   *                 followed by a blank line
   *                 followed by N integers, one per line.
   * Postcondition: myScanner is a Scanner for that input file
   *             && myArray is an array containing the N ints.
   */
  public Threaded_Array_Sum(String [] args) {
     if (args.length < 1) {
        System.err.println("\n*** Usage: java Threaded_array_sum <fileName>\n");
        System.exit(1);
     }
     Scanner aScanner = openScanner( args[0] ); // open input file
     myArray = readFile(aScanner);              // fill array with values
     myNumThreads = getNumThreads( args );

  }


  /* utility to open / return a Scanner to a file 
   *   whose name comes from the command-line.
   * 
   * @param: fileName, a String
   * Precondition: fileName is the name of an input file.
   * Return: a Scanner for that input file.
   */
  private Scanner openScanner(String fileName) {
     Scanner in = null;
     try {
        File theFile = new File ( fileName );
        in = new Scanner( theFile );
     } catch ( FileNotFoundException  fnfe ) {
        System.err.println("\n*** Unable to open '" + fileName + "'\n");
        System.exit(1);
     }

     return in;
  }

  /* fill an array with values from a Scanner
   * @param: in, a Scanner to an input file.
   * Precondition: the first line of the input file is N,
   *                the number of (other) numbers in the file.
   * Postcondition: the N int values have been read
   *                 from 'in' and stored in an array.
   * Return: the array containing the N int values.
   */
  private int[] readFile(Scanner in) {
     int numNumbers = in.nextInt();           // read how many numbers
     int [] array = new int[numNumbers];      // allocate array
     for (int i = 0; i < array.length; i++) { // fill array
        array[i] = in.nextInt();              //   with numbers
     }
     in.close();                              // close input file
     return array;                            // we're done
  }

  /* how long does it take to process the values in myArray?
   * Precondition: myArray has been filled with N input values.
   * Output: the sum of the values in myArray
   *          and how long it took to compute that sum.
   */
  public void run() {
     long startTime = System.nanoTime();             // start timing
     long sum = sumArray(myArray);                    // sum the values
     long totalTime = System.nanoTime() - startTime; // stop timing
     
     System.out.println("\nThe sum of the " + myArray.length
                         + " numbers is: " + sum 
                         + "\n and summing them took " 
                         + totalTime + " time units.\n");
  }

  /* sum the values in an array
   * @param: arr, an array of integers
   * Return: the sum of the int values in arr.
   */
  private long sumArray(int[] arr) {
    Helper[] helpers = new Helper[myNumThreads];

    for (int i = 1; i < myNumThreads; ++i) {     // for each helper:
       helpers[i] = new Helper(i);                  //  create, and
       helpers[i].start();                          //  launch them
    }

    long sum = sumSlice(0);                         // main thread does slice 0

    try {
       for (int i = 1; i < myNumThreads; ++i) {  // for each helper h:
          helpers[i].join();                        //  wait for h to finish
          sum += helpers[i].getPartialSum();        //  get its partial sum
       }
    } catch( InterruptedException ie) {             // required by join()
       System.err.println("\n*** a Helper was interrupted!\n");
       System.err.println(ie);
       System.exit(1);
    }

    return sum;
 }

  private int [] myArray = null;
  private int myNumThreads = 1;


  private final int getNumThreads( String [] args ) {
    if (args.length >= 2) {
       return Integer.parseInt( args[1] );
    } else {
       return 1;
    }
 }

 private class Helper extends Thread {

    public Helper(int id) {
      super();
      myID = id;
      myPartialSum = 0;
    }

    public void run() {
        myPartialSum = sumSlice(myID);
    }

    public final long getPartialSum() {
       return myPartialSum;
    }

    private int  myID = 0;
    private long myPartialSum = 0;
 } // Helper


 private long sumSlice(int id) {
    int sliceSize = myArray.length / myNumThreads;
    int start = id * sliceSize;         // starting index
    int stop = (id+1) * sliceSize;      // stopping index
    if ( id == myNumThreads-1 ) {       // have final thread
        stop = myArray.length;            //  handle leftovers
    } 
    long sliceSum = 0;
    for (int i = start; i < stop; ++i) {  // sum the ints
        sliceSum += myArray[i];           //  in my slice
    }
    return sliceSum;
}



}

]0;gy24@gold12: ~/cs214/labs/12/java[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/java[00m$ javac -depreaction [K[K[K[K[K[K[Kcation Threaded [K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kjava Threaded_Array_Sum ../numbers/10000numbers.txt 4[1P[1P[1@0[1@0[1@0[1@0[C[C[C[C[C[C[C[C[C[C[C[C[C[K1

The sum of the 1000000 numbers is: 50473230
 and summing them took 4184677 time units.

]0;gy24@gold12: ~/cs214/labs/12/java[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/java[00m$ java Threaded_Array_Sum ../numbers/1000000numbers.txt 1[K4

The sum of the 1000000 numbers is: 50473230
 and summing them took 16980945 time units.

]0;gy24@gold12: ~/cs214/labs/12/java[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/java[00m$ ^C
]0;gy24@gold12: ~/cs214/labs/12/java[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/java[00m$ exit

Script done on 2022-04-09 19:12:17-04:00 [COMMAND_EXIT_CODE="130"]
