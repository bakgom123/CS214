/* Bird.java provides a Bird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Mar 29, 2022
 ******************************************************/

import java.io.*;

public abstract class Bird
{

 /* default constructor
  * PostCond: myName == "".
  */
  public Bird()
  {
	  myName = "";
  } 


 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Bird(String name)
  {
	  myName = name;
  } 


 /* Name accessor
  * Return: myName.
  */
  public String getName()
  {
	  return myName;
  }


 /* A Bird's Call
  * Return: a default bird-call ("Squawk!").
  */
  public String call()
  {
	  return "Squaaaaaaaaaawk!";
  }


 /* Output a Bird 
  * Output: Everything known about myself
  *          to the standard output stream.
  */
  public void print()
  {
	  System.out.println( getName() + ' ' + getClass().getName() + " just " + movement() + " and says " + call() );
  }



  private String myName;


  /**
   * Get a Bird's movement.
   * @return The movement of the bird.
   */
  public abstract String movement();

}






