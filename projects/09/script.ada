Script started on 2022-03-23 19:39:58-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="271" LINES="17"]
]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ cat temperature_package.adb
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

end Temperature_Package;]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ cat temperature_package.adb[K[K[Kads
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
	 
end Temperature_Package;]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ cat temperature_package.ads[K[K[K[K[K[K[K[K[K[K[K[K_tester.adb
-- Tester of temperature package, and it has the main function
-- Author: David Yoo (gy24)
-- Date: 03/23/2020

with Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;
use Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;

procedure Temperature_Tester is
   Start: Temperature_Package.Temperature;
   Stop: Temperature_Package.Temperature;
   Step: Float;
   Error: Boolean := False;
   Current: Temperature_Package.Temperature;
begin
   Put("Temperature examples:"); New_Line;
   Put("20.5 C"); New_Line;
   Put("10 K"); New_Line;
   Put("35.1 F"); New_Line;
   Put("Please enter a start temperature: ");
   Start := Temperature_Package.Read_Temp(Error);
   while Error loop
      Put("Invalid input, please enter a valid input: ");
      Start := Temperature_Package.Read_Temp(Error);
   end loop;

   Put("Please enter a stop temperature: ");
   Stop := Temperature_Package.Read_Temp(Error);
   while Error loop
      Put("Invalid input, please enter a valid input: ");
      Stop := Temperature_Package.Read_Temp(Error);
   end loop;

   Put("Please enter a step amount of degrees: ");
   Step := Temperature_Package.Read_Degrees(Error);
   while Error loop
      Put("Invalid input, please enter a valid input: ");
      Step := Temperature_Package.Read_Degrees(Error);
   end loop;
   
   if Temperature_Package.Equals(Start, Stop) then
      Put("Start and stop temperatures are equal");
      New_Line;
      return;
   end if;

   Current := Start;
   Table:
      loop
         if Temperature_Package.Less_Than(Start, Stop) /= Temperature_Package.Less_Than(Current, Stop) and not Temperature_Package.Equals(Current, Stop) then
            exit Table;
         end if;

         if Temperature_Package.Less_Than(Start, Stop) then
            Current := Temperature_Package.RaiseIt(Current, Step);
         else
            Current := Temperature_Package.Lower(Current, Step);
         end if;

      -- set_col: https://stackoverflow.com/questions/9876568/how-to-read-some-specific-columns-in-a-file
         set_col(1);
         Put(Temperature_Package.ToF(Current));
         set_col(17);
         Put(Temperature_Package.ToC(Current));
         set_col(32);
         Put(Temperature_Package.TOK(Current));
         New_Line;
         
      end loop Table;

end Temperature_Tester;]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ cat temperature_tester.adbpackage.adsblojure -m temperature_tester[3Pat temperature_tester.cljlojure -m temperature_tester[2Pat temperature_package.adbs[1Ptester.adb[Kgnatmake temperature_tester
x86_64-linux-gnu-gcc-7 -c temperature_tester.adb
x86_64-linux-gnu-gnatbind-7 -x temperature_tester.ali
x86_64-linux-gnu-gnatlink-7 temperature_tester.ali
]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ ./temperature_tester
Temperature examples:
20.5 C
10 K
35.1 F
Please enter a start temperature: 0 F
Please enter a stop temperature: 100 C
Please enter a step amount of degrees: 2.5

2.500 F         -16.389 C      256.761 K
5.000 F         -15.000 C      258.150 K
7.500 F         -13.611 C      259.539 K
10.000 F        -12.222 C      260.928 K
12.500 F        -10.833 C      262.317 K
15.000 F        -9.444 C       263.706 K
17.500 F        -8.056 C       265.094 K
20.000 F        -6.667 C       266.483 K
22.500 F        -5.278 C       267.872 K
25.000 F        -3.889 C       269.261 K
27.500 F        -2.500 C       270.650 K
30.000 F        -1.111 C       272.039 K
32.500 F        0.278 C        273.428 K
35.000 F        1.667 C        274.817 K
37.500 F        3.056 C        276.206 K
40.000 F        4.444 C        277.594 K
42.500 F        5.833 C        278.983 K
45.000 F        7.222 C        280.372 K
47.500 F        8.611 C        281.761 K
50.000 F        10.000 C       283.150 K
52.500 F        11.389 C       284.539 K
55.000 F        12.778 C       285.928 K
57.500 F        14.167 C       287.317 K
60.000 F        15.556 C       288.706 K
62.500 F        16.944 C       290.094 K
65.000 F        18.333 C       291.483 K
67.500 F        19.722 C       292.872 K
70.000 F        21.111 C       294.261 K
72.500 F        22.500 C       295.650 K
75.000 F        23.889 C       297.039 K
77.500 F        25.278 C       298.428 K
80.000 F        26.667 C       299.817 K
82.500 F        28.056 C       301.206 K
85.000 F        29.444 C       302.594 K
87.500 F        30.833 C       303.983 K
90.000 F        32.222 C       305.372 K
92.500 F        33.611 C       306.761 K
95.000 F        35.000 C       308.150 K
97.500 F        36.389 C       309.539 K
100.000 F       37.778 C       310.928 K
102.500 F       39.167 C       312.317 K
105.000 F       40.556 C       313.706 K
107.500 F       41.944 C       315.094 K
110.000 F       43.333 C       316.483 K
112.500 F       44.722 C       317.872 K
115.000 F       46.111 C       319.261 K
117.500 F       47.500 C       320.650 K
120.000 F       48.889 C       322.039 K
122.500 F       50.278 C       323.428 K
125.000 F       51.667 C       324.817 K
127.500 F       53.056 C       326.206 K
130.000 F       54.444 C       327.594 K
132.500 F       55.833 C       328.983 K
135.000 F       57.222 C       330.372 K
137.500 F       58.611 C       331.761 K
140.000 F       60.000 C       333.150 K
142.500 F       61.389 C       334.539 K
145.000 F       62.778 C       335.928 K
147.500 F       64.167 C       337.317 K
150.000 F       65.556 C       338.706 K
152.500 F       66.944 C       340.094 K
155.000 F       68.333 C       341.483 K
157.500 F       69.722 C       342.872 K
160.000 F       71.111 C       344.261 K
162.500 F       72.500 C       345.650 K
165.000 F       73.889 C       347.039 K
167.500 F       75.278 C       348.428 K
170.000 F       76.667 C       349.817 K
172.500 F       78.056 C       351.206 K
175.000 F       79.444 C       352.594 K
177.500 F       80.833 C       353.983 K
180.000 F       82.222 C       355.372 K
182.500 F       83.611 C       356.761 K
185.000 F       85.000 C       358.150 K
187.500 F       86.389 C       359.539 K
190.000 F       87.778 C       360.928 K
192.500 F       89.167 C       362.317 K
195.000 F       90.556 C       363.706 K
197.500 F       91.944 C       365.094 K
200.000 F       93.333 C       366.483 K
202.500 F       94.722 C       367.872 K
205.000 F       96.111 C       369.261 K
207.500 F       97.500 C       370.650 K
210.000 F       98.889 C       372.039 K
212.500 F       100.278 C      373.428 K
]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ ^C
]0;gy24@remotel3: ~/cs214/projects/09/ada[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ada[00m$ exit

Script done on 2022-03-23 19:41:04-04:00 [COMMAND_EXIT_CODE="130"]
