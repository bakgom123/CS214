-- temperature_package.ads declares the Temperature type and its operations.
-- Author: David Yoo (gy24)
-- Date: 03/23/2020
package Temperature_Package is
   type Temperature is private;
   
   -- initialize a Temperature
   procedure Init(Temp: out Temperature; Value: in Float; Scale: in Character);
   
   -- get the value
   function Get_Value(Temp: in Temperature) 
   return Float;
   
   -- get the scale
   function Get_Scale(Temp: in Temperature) 
   return Character;

   -- convert to Celcius
   function ToC(Temp: in Temperature) 
   return Temperature;

   -- convert to Fahrenheit.
   function ToF(Temp: in Temperature) 
   return Temperature;

   -- convert to Kelvin
   function ToK(Temp: in Temperature) 
   return Temperature;
    
   -- An input operation that lets a Temperature be conveniently input as a single entity (e.g., 98.6 F).
   function Read_Temp(Error: out Boolean) 
   return Temperature;

   -- read the degrees
   function Read_Degrees(Error: out Boolean) 
   return Float;
   
   -- An output operation that lets a Temperature be displayed conveniently.
   procedure Put(Temp: in Temperature);

   -- given a Temperature and real degrees, returns a Temperature that is degrees higher than the Temperature received.
   function RaiseIt(Temp: in Temperature; Degrees: in Float) 
   return Temperature;

   -- given a Temperature and a real degrees, returns a Temperature that is degrees lower than the Temperature received. 
   function Lower(Temp: in Temperature; Degrees: in Float) 
   return Temperature;

   -- given two Temperature operands, returns true if and only if the left operand is equal to the right operand.
   function Equals(Temp1, Temp2: in Temperature) 
   return Boolean;

   -- given two Temperature operands, returns true if and only if the left operand is less-than the right operand. 
   function Less_Than(Temp1, Temp2: in Temperature) 
   return Boolean;
   
private
    KELVIN: constant Character := 'K';
    CELSIUS: constant Character := 'C';
    FAHRENHEIT: constant Character := 'F';
   
   -- convert from celsius
   function ConvertFromC(Value_Celsius: in Float; Scale: in Character) 
   return Float;

   -- convert from Kelvin
   function ConvertFromK(Value_Kelvin: in Float; Scale: in Character) 
   return Float;

   -- convert from Fahrenheit
   function ConvertFromF(Value_Fahrenheit: in Float; Scale: in Character) 
   return Float;
   
   -- check the scale is valid
   function Is_Scale_Valid(Scale: in Character) 
   return Boolean;

   -- check if the temperature is in Celsius
   function CheckCelsius(Scale: in Character) 
   return Boolean;

   -- check if the temperature is in Fahrenheit.
   function CheckFahrenheit(Scale: in Character) 
   return Boolean;

   -- check if the temperature is in Kelvin.
   function CheckKelvin(Scale: in Character) 
   return Boolean;

   -- convert temperature into another scale
   function Convert_T(Temp: in Temperature; Scale: in Character) 
   return Temperature;
   
   type Temperature is
      record
         Value: Float;
         Scale: Character;
      end record;
	 
end Temperature_Package;