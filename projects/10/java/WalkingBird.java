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
}