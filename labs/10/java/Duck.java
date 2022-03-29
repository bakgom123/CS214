/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Mar 24, 2022
 ******************************************************/

public class Duck extends Bird {
    
 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Duck() {
    super();
  }

 public Duck(String name){     
    super(name);
  }



 /* A Duck's Call
  * Return: a duck-call ("Quack!").
  */
  public String call(){
     return "Quack!";
  } 

}

