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
}