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

