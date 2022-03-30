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
}