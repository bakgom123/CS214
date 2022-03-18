Script started on 2022-03-16 22:14:09-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="12"]
]0;gy24@remotel3: ~/cs214/projects/08[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/08[00m$ cat Name [KTester,[K.java
/* NameTester.java is a 'driver' to test class Name.
 * Author: David Yoo (gy24)
 * Date: Mar 15, 2022
 ************************************************************/

import java.util.Scanner;
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

     aName.setFirst("David");
     assert aName.getFirst().equals("David");
	   aName.setMiddle("Gunju");
	   assert aName.getMiddle().equals("Gunju");
	   aName.setLast("Yoo");
	   assert aName.getLast().equals("Yoo");

	   assert aName.lfmi().equals("Yoo, David G");

     System.out.println("All tests passed!");
     System.out.println("Please enter your first, middle, last name and press enter each time you enter your name):");
	   aName.readName();
	   System.out.println(aName);
  }
}

// Replace this line with the declaration of class Name...
class Name
{
  private String first, middle, last;
  public Name(String first, String middle, String last){
    this.first = first;
    this.middle = middle;
    this.last = last;
  }
  public String getFirst(){
    return first;
  }
  public String getMiddle(){
    return middle;
  }
  public String getLast(){
    return last;
  }
  public String toString(){
    return first + ' ' + middle + ' ' + last;
  }
  public void setFirst(String first){
    this.first = first;
  }
  public void setMiddle(String middle){
    this.middle = middle;
  }
  public void setLast(String last){
    this.last = last;
  }
  String lfmi() {
    return last + ", " + first + ' ' + middle.charAt(0);
  }
  private Scanner scanner = new Scanner(System.in);

    
 void readName() {
    first = scanner.nextLine();
	  middle = scanner.nextLine();
	  last = scanner.nextLine();
 }
}
]0;gy24@remotel3: ~/cs214/projects/08[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/08[00m$ javac -deprecation Namet[KTester.java
]0;gy24@remotel3: ~/cs214/projects/08[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/08[00m$ java NameTester
John Paul Jones
All tests passed!
Please enter your first, middle, last name and press enter each time you enter your name):
David
Gunju
Yoo
David Gunju Yoo
]0;gy24@remotel3: ~/cs214/projects/08[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/08[00m$ exit

Script done on 2022-03-16 22:14:48-04:00 [COMMAND_EXIT_CODE="0"]
