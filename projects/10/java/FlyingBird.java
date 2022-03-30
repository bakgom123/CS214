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
}