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
}