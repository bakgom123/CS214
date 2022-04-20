import java.util.LinkedList;

/* Max.java finds the maximum values in Java linked lists, and finds the index of values.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: Apr 5, 2022
 */

import java.util.Collections;
import java.util.Iterator;

public class Max {

  public static void main(String [] args) {
    // define list1, list2, list3 here ...
    LinkedList<Integer> list1 = new LinkedList<Integer>(),
                        list2 = new LinkedList<Integer>(),
                        list3 = new LinkedList<Integer>(),
                        list4 = new LinkedList<Integer>();


    list1.add(99);    // 99, 88, 77, 66, 55
    list1.add(88);    // max is first
    list1.add(77);
    list1.add(66);  
    list1.add(55);

    list2.add(55);    // 55, 66, 77, 88, 99
    list2.add(66);    // max is last
    list2.add(77);  
    list2.add(88);  
    list2.add(99);  
  
    list3.add(55);    // 55, 77, 99, 88, 66
    list3.add(77);    // max is in the middle
    list3.add(99);  
    list3.add(88);  
    list3.add(66);  

    list4.add(55);    // 55, 77, 11, 88, 66
    list4.add(77);    // max is in the middle
    list4.add(11);  
    list4.add(88);  
    list4.add(66); 
  
    print(list1); 
    print(list2); 
    print(list3);
    print(list4);

   // display maxima of the 3 lists...
   System.out.println("Max of list1: " + Collections.max(list1));
   System.out.println("Max of list2: " + Collections.max(list2));
   System.out.println("Max of list3: " + Collections.max(list3));
   System.out.println("Max of list4: " + Collections.max(list4));


   System.out.println("Index of 99 in list1: " + search(list1, 99));
   System.out.println("Index of 99 in list2: " + search(list2, 99));
   System.out.println("Index of 99 in list3: " + search(list3, 99));
   System.out.println("Index of 99 in list4: " + search(list4, 99));

  }

  /** print() displays a LinkedList on the console.
   *
   * @param: aList, a LinkedList<Integer>
   * 
   * Postcondition: the Integer values in aList
   *                 have been displayed to System.out,
   *                 separated by spaces.
   */
  // replace this line with the definition of print().
  public static void print(LinkedList<Integer> aList){
    Iterator<Integer> listIterator = aList.iterator();
    while (listIterator.hasNext()){
        System.out.print(listIterator.next() + " ");
    }
    System.out.print('\n');
      }

  
  public static int search(LinkedList<Integer> aList, int aVal){
    int i = 0;
    Iterator<Integer> it = aList.iterator();
    while(it.hasNext()){
      if(it.next() == aVal)
        return i; //return the index
      i++;
    }
    return -1; //not found? then return -1
  }

}

