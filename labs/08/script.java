Script started on 2022-03-10 15:44:07-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="12"]
]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ make javacat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Yoo (gy24)
 * Date: Mar 10, 2022
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

// Replace this line with the declaration of class Name...
class Name
{
  private String myFirst, myMiddle, myLast;
  public Name(String first, String middle, String last){
    myFirst = first;
    myMiddle = middle;
    myLast = last;
  }
  public String getFirst(){
    return myFirst;
  }
  public String getMiddle(){
    return myMiddle;
  }
  public String getLast(){
    return myLast;
  }
  public String toString(){
    return myFirst + ' ' + myMiddle + ' ' + myLast;
  }
};
]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ make java
javac -deprecation NameTester.java
]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ java NameTester
John Paul Jones
All tests passed!
]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ exit

Script done on 2022-03-10 15:44:24-05:00 [COMMAND_EXIT_CODE="0"]
