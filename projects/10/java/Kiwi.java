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
}