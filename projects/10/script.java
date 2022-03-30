Script started on 2022-03-30 00:26:32-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="17"]
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Bird.java
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






]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Birds.java
/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Mar 29, 2022
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      Duck duck = new Duck("Donald");
      duck.print();

      Penguin penguin = new Penguin("Peter");
      penguin.print();

      Goose goose = new Goose("Mother");
      goose.print();

      Ostrich ostrich = new Ostrich("Orville");
      ostrich.print();

      Kiwi kiwi = new Kiwi("Harry");
      kiwi.print();
      
      System.out.println();
    }
}

]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Duck.java
/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Mar 29, 2022
 ******************************************************/

public class Duck extends FlyingBird {
    
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

]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat FlyingBirds[K.java
/**
 * FlyingBird.java defines the flying bird
 *
 * Created by: David Yoo (gy24)
 * Date: Mar 29, 2022
 */

public class FlyingBird extends Bird {
    /**
     * implicit constructor
     */
    public FlyingBird() {
	    super();
    }

    /**
     * explicit constructor
     */
    public FlyingBird(String name) {
	    super(name);
    }

    /**
     * Get this Bird's movement.
     */
    public String movement() {
	    return "flew past";
    }
}]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Goose.java
/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Mar 29, 2022
 ******************************************************/

public class Goose extends FlyingBird {

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Goose()
  {
     super();
  }

  public Goose(String name)
  {     
    super(name);
  } 



 /* A Goose's Call
  * Return: a goose-call ("Honk!").
  */
  public String call(){
    return "Honk!";
  }

} 

]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Kiwi.java
/**
 * Kiwi.java provides a Kiwi class.
 *
 * Created by: David Yoo (gy24)
 * Date: Mar 29, 2022
 */

public class Kiwi extends WalkingBird {
    /**
     * implicit constructor
     */
    public Kiwi() {
	    super();
    }

    /**
     * explicit constructor
     */
    public Kiwi(String name) {
	    super(name);
    }

    /**
     * Get this Bird's call.
     */
    public String call() {
	    return "Kiwiii!";
    }
}]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Ostrich.java
/**
 * Ostrich.java provides a ostrich class.
 *
 * Created by: David Yoo (gy24)
 * Date: Mar 29, 2022
 */

public class Ostrich extends WalkingBird {
    /**
     * implicit constructor
     */
    public Ostrich() {
	    super();
    }

    /**
     * explicit constructor
     */
    public Ostrich(String name) {
	    super(name);
    }

    /**
     * Get ostrich's call.
     */
    public String call() {
	    return "Snork!";
    }
}]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Owl.java
/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Mar 29, 2022
 ******************************************************/

public class Owl extends FlyingBird {

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Owl()
  {
     super();
  }

  public Owl(String name)
  {     
    super(name);
  } 



 /* An Owl's Call
  * Return: an owl-call ("Whoo-hoo!").
  */
  public String call(){
    return "Whoo-hoo!";
  }


} 

]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat Penguin.java
/**
 * Penguin.java provides a penguin class.
 *
 * Created by: David Yoo (gy24)
 * Date: Mar 29, 2022
 */

public class Penguin extends WalkingBird {
    /**
     * implicit constructor
     */
    public Penguin() {
	    super();
    }

    /**
     * explicit constructor
     */
    public Penguin(String name) {
	    super(name);
    }

    /**
     * Get this Bird's call.
     */
    public String call() {
	    return "Huh-huh-huh-huuuuh!";
    }
}]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ cat WalkingBird.java
/**
 * WalkingBird.java defines the behavior of a walking bird.
 *
 * Created by: David Yoo (gy24)
 * Date: Mar 29, 2022
 */

public class WalkingBird extends Bird {
    /**
     * implicit constructor
     */
    public WalkingBird() {
	    super();
    }

    /**
     * explicit constructor
     */
    public WalkingBird(String name) {
	    super(name);
    }

    /**
     * Get this Bird's movement.
     */
    public String movement() {
	    return "walked past";
    }
}]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation Birds.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation Bird.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation Duck.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation FlyingBirds[K.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ c[Kjavac -deprecation Goose.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation Kiwi.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ ca[K[Kjavac -deprecation Osti[Krich.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation Owl.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation Pengui[Kin.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ javac -deprecation WalkingBird.java
]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ java Birds.java[K[K[K[K[K

Welcome to the Bird Park!

Donald Duck just flew past and says Quack!
Peter Penguin just walked past and says Huh-huh-huh-huuuuh!
Mother Goose just flew past and says Honk!
Orville Ostrich just walked past and says Snork!
Harry Kiwi just walked past and says Kiwiii!

]0;gy24@remotel1: ~/cs214/projects/10/java[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/java[00m$ exit

Script done on 2022-03-30 00:29:03-04:00 [COMMAND_EXIT_CODE="0"]
