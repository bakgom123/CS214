Script started on 2022-03-17 13:49:16-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="151" LINES="12"]
]0;gy24@gold30: ~/cs214/labs/09/java[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/java[00m$ cat[K[K[Kcat Name.java
/* Name.java implements class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Yoo (gy24)
 * Date: Mar 17, 2022
 ************************************************************/

class Name {

    // Name object constructor with initialization  
    public Name(final String first, final String middle, final String last) {
        myFirst = first;
        myMiddle = middle;
        myLast = last;
    }
   
    // extractor for first name of a Name object
    public final String getFirst() {
        return myFirst;
    }
  
    // extractor for middle name of a Name object
    public final String getMiddle() {
        return myMiddle;
    }
  
    // extractor for last name of a Name object
    public final String getLast() {
        return myLast;
    }
    
    // return string created by piecing together first, middle, and last names
    public final String toString() {
        return myFirst + ' ' + myMiddle + ' ' + myLast;
    }
  
    private String myFirst, myMiddle, myLast;  // private instance variables
  }
]0;gy24@gold30: ~/cs214/labs/09/java[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/java[00m$ cat NametES[K[K[KTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Yoo (gy24)
 * Date: Mar 17, 2022
 ************************************************************/

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      System.out.println("All tests passed!");
  }
}

// the Name class appears outside of the rest of the program


]0;gy24@gold30: ~/cs214/labs/09/java[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/java[00m$ javac -deprecation Name.java
]0;gy24@gold30: ~/cs214/labs/09/java[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/java[00m$ javac -dee[Kprecation NameTester.java
]0;gy24@gold30: ~/cs214/labs/09/java[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/java[00m$ java NameTester
John Paul Jones
All tests passed!
]0;gy24@gold30: ~/cs214/labs/09/java[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/java[00m$ exit

Script done on 2022-03-17 13:50:00-04:00 [COMMAND_EXIT_CODE="0"]
