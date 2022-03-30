-- temperature_package.adb defines operations for the Temperature type.
-- Author: David Yoo (gy24)
-- Date: 03/23/2020

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Characters.Handling;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Characters.Handling;

package body Temperature_Package is
   -- initialize a Temperature
   procedure Init(Temp: out Temperature; Value: in Float; Scale: in Character) is
   begin
      if not Is_Scale_Valid(Scale) then
         Put("Invalid scale");
         return;
      end if;
      
      Temp.Value := Value;
      Temp.Scale := To_Upper(Scale);
   end Init;
   
   -- get the value
   function Get_Value(Temp: in Temperature) return Float is
   begin
      return Temp.Value;
   end Get_Value;
   
   -- get the scale
   function Get_Scale(Temp: in Temperature) return Character is
   begin
      return Temp.Scale;
   end Get_Scale;
   
   -- convert to Celsius
   function toC(Temp: in Temperature) return Temperature is
      TempN: Temperature;
   begin
      if CheckKelvin(Temp.Scale) then
         Init(TempN, ConvertFromK(Temp.Value, CELSIUS), CELSIUS);
      elsif CheckFahrenheit(Temp.Scale) then
         Init(TempN, ConvertFromF(Temp.Value, CELSIUS), CELSIUS);
      else
         return Temp;
      end if;
      return TempN;
   end toC;

   -- convert to Fahrenheit
   function toF(Temp: in Temperature) return Temperature is
      TempN: Temperature;
   begin
      if CheckKelvin(Temp.Scale) then
         Init(TempN, ConvertFromK(Temp.Value, FAHRENHEIT), FAHRENHEIT);
      elsif CheckCelsius(Temp.Scale) then
         Init(TempN, ConvertFromC(Temp.Value, FAHRENHEIT), FAHRENHEIT);
      else
         return Temp;
      end if;
      return TempN;
   end toF;

   -- convert to Kelvin
   function toK(Temp: in Temperature) return Temperature is
      TempN: Temperature;
   begin
      if CheckCelsius(Temp.Scale) then
         Init(TempN, ConvertFromC(Temp.Value, KELVIN), KELVIN);
      elsif CheckFahrenheit(Temp.Scale) then
         Init(TempN, ConvertFromF(Temp.Value, KELVIN), KELVIN);
      else
         return Temp;
      end if;
      return TempN;
   end toK;

   -- An input operation that lets a Temperature be conveniently input as a single entity (e.g., 98.6 F).
   function Read_Temp(Error: out Boolean) return Temperature is
      Line: String(1 .. 20);
      Last_Index: Natural;
      Value: Float;
      Scale: Character;
      Temp: Temperature;
   begin
      Get_Line(Line, Last_Index);
   
      begin
         Value := Float'Value(Line(Line'First .. Last_Index - 2));
      exception
         when Constraint_Error =>
            Error := True;
            return Temp;
      end;
   
      Scale := Line(Last_Index);
      if not Is_Scale_Valid(Scale) Then
         Error := True;
         return Temp;
      end if;
   
      Error := False;
      Init(Temp, Value, Scale);
      return Temp;
   end Read_Temp;
   
   -- read the degrees
   function Read_Degrees(Error: out Boolean) return Float is
      Line: String(1 .. 20);
      Last_Index: Natural;
      Value: Float;
   begin
      Get_Line(Line, Last_Index);
   
      begin
         Value := Float'Value(Line(Line'First .. Last_Index));
      exception
         when Constraint_Error =>
            Error := True;
            return Value;
      end;
      return Value;
   end;

-- An output operation that lets a Temperature be displayed conveniently.
   procedure Put(Temp: in Temperature) is
   begin
      Put(Temp.Value, 1, 3, 0);
      Put(' ');
      Put(Temp.Scale);
   end Put;
   
   -- given a Temperature and real degrees, returns a Temperature that is degrees higher than the Temperature received.
   function RaiseIt(Temp: in Temperature; Degrees: in Float) return Temperature is
      TempN: Temperature;
   begin
      Init(TempN, Temp.Value + Degrees, Temp.Scale);
      return TempN;
   end RaiseIt;
   
   -- given a Temperature and a real degrees, returns a Temperature that is degrees lower than the Temperature received. 
   function Lower(Temp: in Temperature; Degrees: in Float) return Temperature is
      TempN: Temperature;
   begin
      Init(TempN, Temp.Value - Degrees, Temp.Scale);
      return TempN;
   end Lower;
   
   -- given two Temperature operands, returns true if and only if the left operand is equal to the right operand.
   function Equals(Temp1, Temp2: in Temperature) return Boolean is
      Converted_Temp: Temperature := Temp2;
   begin
      if Temp2.Scale /= Temp1.Scale then
         Converted_Temp := Convert_T(Temp2, Temp1.Scale);
      end if;
      return Temp1.Value = Converted_Temp.Value;
   end Equals;
   
   -- given two Temperature operands, returns true if and only if the left operand is less-than the right operand. 
   function Less_Than(Temp1, Temp2: in Temperature) return Boolean is
      Converted_Temp: Temperature := Temp2;
   begin
      if Temp2.Scale /= Temp1.Scale then
         Converted_Temp := Convert_T(Temp2, Temp1.Scale);
      end if;
      return Temp1.Value < Converted_Temp.Value;
   end Less_Than;
   
   -- convert temperature into another scale
   function Convert_T(Temp: in Temperature; Scale: in Character) return Temperature is
   begin
      if Temp.Scale = Scale then
         return Temp;
      elsif CheckKelvin(Scale) then
         return toK(Temp);
      elsif CheckCelsius(Scale) then
         return toC(Temp);
      elsif CheckFahrenheit(Scale) then
         return toF(Temp);
      else
         Put("Invalid input"); New_Line;
         return Temp;
      end if;
   end Convert_T;
   
   -- convert from celsius
   function ConvertFromC(Value_Celsius: in Float; Scale: in Character) return Float is
   begin
      if CheckFahrenheit(Scale) then
         return (Value_Celsius * 9.0 / 5.0) + 32.0;
      elsif CheckKelvin(Scale) then
         return Value_Celsius + 273.15;
      else
         Put("Invalid input");
         return 0.0;
      end if;
   end ConvertFromC;
   
   -- convert from Kelvin
   function ConvertFromK(Value_Kelvin: in Float; Scale: in Character) return Float is
      In_Celsius: Float := Value_Kelvin - 273.15;
   begin
      if CheckCelsius(Scale) then
         return In_Celsius;
      elsif CheckFahrenheit(Scale) then
         return ConvertFromC(In_Celsius, FAHRENHEIT);
      else
         Put("Invalid scale provided for ConvertFromK. Options are: F,f,C,c");
         return 0.0;
      end if;
   end ConvertFromK;
   
   -- convert from Fahrenheit
   function ConvertFromF(Value_Fahrenheit: in Float; Scale: in Character) return Float is
      In_Celsius: Float := (Value_Fahrenheit - 32.0) * 5.0 / 9.0;
   begin
      if CheckCelsius(Scale) then
         return In_Celsius;
      elsif CheckKelvin(Scale) then
         return ConvertFromC(In_Celsius, KELVIN);
      else
         Put("Invalid input");
         return 0.0;
      end if;
   end ConvertFromF;
   
   -- check if the temperature is in Celsius
   function CheckCelsius(Scale: in Character) return Boolean is
   begin
      return Scale = 'c' or Scale = 'C';
   end CheckCelsius;
   
   -- check if the temperature is in Fahrenheit.
   function CheckFahrenheit(Scale: in Character) return Boolean is
   begin
      return Scale = 'f' or Scale = 'F';
   end CheckFahrenheit;
   
   -- check if the temperature is in Kelvin.
   function CheckKelvin(Scale: in Character) return Boolean is
   begin
      return Scale = 'k' or Scale = 'K';
   end CheckKelvin;
   
   -- check the scale is valid
   function Is_Scale_Valid(Scale: in Character) return Boolean is
   begin
      if not CheckKelvin(Scale) and not CheckCelsius(Scale) and not CheckFahrenheit(Scale) then
         return False;
      else
         return True;
      end if;
   end Is_Scale_Valid;

end Temperature_Package;