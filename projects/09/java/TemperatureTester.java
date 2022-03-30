/*
 * Tester for Temperature.java, and it also contains main function
 * Author: David Yoo (gy24)
 * Date: 03/23/2020
 */
import java.util.Scanner;
class TemperatureTester {
    public static void main(String[] args) {
	System.out.println("Temperature examples:");
	System.out.println("\t20.5 C");
	System.out.println("\t10 K");
	System.out.println("\t35.1 F");
	System.out.print("Please enter a start temperature: ");
	Temperature startTemp = Temperature.readTemp();
	while (startTemp == null) {
	    System.out.print("Invalid input, please enter a valid input: ");
	    startTemp = Temperature.readTemp();
	}
	System.out.print("Please enter a stop temperature: ");
	Temperature stopTemp = Temperature.readTemp();
	while (stopTemp == null) {
	    System.out.print("Invalid input, please enter a valid input: ");
	    stopTemp = Temperature.readTemp();
	}
        
	Scanner scanner = new Scanner(System.in);
	String stepString = "";
	float amount = 0;
	boolean hasStep = false;
	int i = 0;
	while (!hasStep) {
	    if (i == 0)
			System.out.print("Please enter a step amount of degrees: ");
	    else
			System.out.print("Invalid input, please enter a valid input: ");
	    try {
			stepString = scanner.nextLine();
			amount = Float.parseFloat(stepString);
			hasStep = true;
	    } catch (NumberFormatException e) {	}
	    i++;
	}
	scanner.close();

	if (startTemp.equals(stopTemp)) {
	    System.out.println("Start and stop temperatures are equal.");
	    return;
	}

	Temperature current = startTemp;
	while (true) {
	    if (startTemp.lessThan(stopTemp) != current.lessThan(stopTemp) && !current.equals(stopTemp))
		break;

	    current.toF().print();
	    System.out.print("\t\t");
	    current.toC().print();
	    System.out.print("\t\t");
	    current.toK().print();
	    System.out.println();

	    if (startTemp.lessThan(stopTemp))
			current = current.raise(amount);
	    else
			current = current.lower(amount);
	}
	}	
}