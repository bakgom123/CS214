Script started on 2022-03-23 19:04:29-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="271" LINES="17"]
]0;gy24@remotel3: ~/cs214/projects/09/java[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/java[00m$ cat Temperature.java
/*
 * This program convert temperatures in different scales
 * Author: David Yoo (gy24)
 * Date: 03/22/2020
 */


import java.util.Scanner;

class Temperature {
    private char scale;
    private double value;

    private static final char KELVIN = 'K';
    private static final char CELSIUS = 'C';
    private static final char FAHRENHEIT = 'F';
    private static Scanner scanner = new Scanner(System.in);

    // temperature with a value and scale
    // IllegalArgumentException: https://docs.oracle.com/javase/7/docs/api/java/lang/IllegalArgumentException.html
    Temperature(double value, char scale) {
        this.scale = Character.toUpperCase(scale);
        this.value = value;
        if (!isScaleValid(this.scale)){
            throw new IllegalArgumentException("Invalid input");
        }
    }

    // return the current value
    double getValue(){ 
        return value; 
    }

    // return the current scale
    char getScale(){
        return scale;
    }


    // convert temperature to Celsius
    Temperature toC(){
        if (scale == KELVIN){
            return new Temperature(value - 273.15, CELSIUS);
        } else if (scale == FAHRENHEIT){
            return new Temperature((value - 32.0) * 5.0 / 9.0, CELSIUS);
        }
        return this;
    }

    // convert temperature to Fahrenheit
    Temperature toF(){
        if (scale == KELVIN){
            return new Temperature((value - 273.15) * 9.0 / 5.0 + 32.0, FAHRENHEIT);
        } else if (scale == CELSIUS){
            return new Temperature((value * 9.0 / 5.0) + 32.0, FAHRENHEIT);
        }
        return this;
    }

    // convert temperature to Kelvin
    Temperature toK(){
        if (scale == CELSIUS){
            return new Temperature(value + 273.15, KELVIN);
        } else if (scale == FAHRENHEIT){
            return new Temperature((value - 32.0) * 5.0 / 9.0 + 273.15, KELVIN);
        }
        return this;
    }

    // convert temperature into another scale
    private static Temperature convertTemp(Temperature temp, char scale) {
        if (temp.scale != scale) {
            if (scale == CELSIUS){
                return temp.toC();
            }  
            else if (scale == KELVIN) {
                return temp.toK();
            }   
            else if (scale == FAHRENHEIT){
                return temp.toF();
            }    
        }
        return temp;
    }


    // An input operation that lets a Temperature be conveniently input as a single entity (e.g., 98.6 F).
    // split: https://www.baeldung.com/string/split
    static Temperature readTemp() {
        String input = scanner.nextLine();
        String[] anArray = input.split(" ");
        if (anArray.length == 0)
            return null;
        float value = Float.parseFloat(anArray[0]);
        char scale = anArray[1].charAt(0);
        return new Temperature(value, scale);
    }

    // An output operation that lets a Temperature be displayed conveniently.
    // formatting: https://docs.oracle.com/javase/tutorial/java/data/numberformat.html
    void print() {
	    System.out.printf("%.3f %c", value, scale);
    }

    // given a Temperature and real degrees, returns a Temperature that is degrees higher than the Temperature received.
    Temperature raise(float degrees) {
	    return new Temperature(value + degrees, scale);
    }

    // given a Temperature and a real degrees, returns a Temperature that is degrees lower than the Temperature received.
    Temperature lower(float degrees) {
	    return new Temperature(value - degrees, scale);
    }

    // given two Temperature operands, returns true if and only if the left operand is equal to the right operand.
    boolean equals(Temperature temp) {
	    return convertTemp(temp, scale).value == value;
    }

    // given two Temperature operands, returns true if and only if the left operand is less-than the right operand.
    boolean lessThan(Temperature temp) {
	    return value < convertTemp(temp, scale).value;
    }


    // check if the scale is valid
    private static boolean isScaleValid(char scale) {
        char upperCased = Character.toUpperCase(scale);
        return upperCased == KELVIN || upperCased == CELSIUS || upperCased == FAHRENHEIT;
    }
}]0;gy24@remotel3: ~/cs214/projects/09/java[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/java[00m$ cat TemperatureTester.java
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
}]0;gy24@remotel3: ~/cs214/projects/09/java[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/java[00m$ javac -deprecation Temperature.java
]0;gy24@remotel3: ~/cs214/projects/09/java[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/java[00m$ javac -deep[K[Ke[Kprecation TemperatureTester.java
]0;gy24@remotel3: ~/cs214/projects/09/java[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/java[00m$ java TemperatureTester
Temperature examples:
	20.5 C
	10 K
	35.1 F
Please enter a start temperature: 0 F
Please enter a stop temperature: 100 C
Please enter a step amount of degrees: 2.5
0.000 F		-17.778 C		255.372 K
2.500 F		-16.389 C		256.761 K
5.000 F		-15.000 C		258.150 K
7.500 F		-13.611 C		259.539 K
10.000 F		-12.222 C		260.928 K
12.500 F		-10.833 C		262.317 K
15.000 F		-9.444 C		263.706 K
17.500 F		-8.056 C		265.094 K
20.000 F		-6.667 C		266.483 K
22.500 F		-5.278 C		267.872 K
25.000 F		-3.889 C		269.261 K
27.500 F		-2.500 C		270.650 K
30.000 F		-1.111 C		272.039 K
32.500 F		0.278 C		273.428 K
35.000 F		1.667 C		274.817 K
37.500 F		3.056 C		276.206 K
40.000 F		4.444 C		277.594 K
42.500 F		5.833 C		278.983 K
45.000 F		7.222 C		280.372 K
47.500 F		8.611 C		281.761 K
50.000 F		10.000 C		283.150 K
52.500 F		11.389 C		284.539 K
55.000 F		12.778 C		285.928 K
57.500 F		14.167 C		287.317 K
60.000 F		15.556 C		288.706 K
62.500 F		16.944 C		290.094 K
65.000 F		18.333 C		291.483 K
67.500 F		19.722 C		292.872 K
70.000 F		21.111 C		294.261 K
72.500 F		22.500 C		295.650 K
75.000 F		23.889 C		297.039 K
77.500 F		25.278 C		298.428 K
80.000 F		26.667 C		299.817 K
82.500 F		28.056 C		301.206 K
85.000 F		29.444 C		302.594 K
87.500 F		30.833 C		303.983 K
90.000 F		32.222 C		305.372 K
92.500 F		33.611 C		306.761 K
95.000 F		35.000 C		308.150 K
97.500 F		36.389 C		309.539 K
100.000 F		37.778 C		310.928 K
102.500 F		39.167 C		312.317 K
105.000 F		40.556 C		313.706 K
107.500 F		41.944 C		315.094 K
110.000 F		43.333 C		316.483 K
112.500 F		44.722 C		317.872 K
115.000 F		46.111 C		319.261 K
117.500 F		47.500 C		320.650 K
120.000 F		48.889 C		322.039 K
122.500 F		50.278 C		323.428 K
125.000 F		51.667 C		324.817 K
127.500 F		53.056 C		326.206 K
130.000 F		54.444 C		327.594 K
132.500 F		55.833 C		328.983 K
135.000 F		57.222 C		330.372 K
137.500 F		58.611 C		331.761 K
140.000 F		60.000 C		333.150 K
142.500 F		61.389 C		334.539 K
145.000 F		62.778 C		335.928 K
147.500 F		64.167 C		337.317 K
150.000 F		65.556 C		338.706 K
152.500 F		66.944 C		340.094 K
155.000 F		68.333 C		341.483 K
157.500 F		69.722 C		342.872 K
160.000 F		71.111 C		344.261 K
162.500 F		72.500 C		345.650 K
165.000 F		73.889 C		347.039 K
167.500 F		75.278 C		348.428 K
170.000 F		76.667 C		349.817 K
172.500 F		78.056 C		351.206 K
175.000 F		79.444 C		352.594 K
177.500 F		80.833 C		353.983 K
180.000 F		82.222 C		355.372 K
182.500 F		83.611 C		356.761 K
185.000 F		85.000 C		358.150 K
187.500 F		86.389 C		359.539 K
190.000 F		87.778 C		360.928 K
192.500 F		89.167 C		362.317 K
195.000 F		90.556 C		363.706 K
197.500 F		91.944 C		365.094 K
200.000 F		93.333 C		366.483 K
202.500 F		94.722 C		367.872 K
205.000 F		96.111 C		369.261 K
207.500 F		97.500 C		370.650 K
210.000 F		98.889 C		372.039 K
]0;gy24@remotel3: ~/cs214/projects/09/java[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/java[00m$ exit

Script done on 2022-03-23 19:05:16-04:00 [COMMAND_EXIT_CODE="0"]
