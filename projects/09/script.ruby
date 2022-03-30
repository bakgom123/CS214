Script started on 2022-03-23 19:44:39-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="271" LINES="17"]
]0;gy24@remotel3: ~/cs214/projects/09/ruby[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ruby[00m$ cat temperature.rb
# This module contains the Temperature class.
# Author: David Yoo (gy24)
# Date: 03/22/2022

module Temperatures


    class Temperature
        CELSIUS = "C"
        FAHRENHEIT = "F"
        KELVIN = "K"
        attr_accessor :degree, :scale
        

        # initialize temperature with a degree and scale
        def initialize(degree, scale)
            if not Temperature.is_scale_valid(scale)
                puts "Invalid scale"
            end
            @degree, @scale = degree, scale.upcase
        end

        # convert temperature to Celsius
        def toC
            if @scale == FAHRENHEIT
                return Temperature.new((@degree - 32) * 5.0 / 9.0, CELSIUS)
            elsif @scale == KELVIN
                return Temperature.new(@degree - 273.15, CELSIUS)
            else
                return self
            end
        end

        # convert temperature to Fahrenheit
        def toF
            if @scale == CELSIUS
                return Temperature.new((@degree * 9.0 / 5.0) + 32, FAHRENHEIT)
            elsif @scale == KELVIN
                return Temperature.new(((@degree - 273.15) * 9.0 / 5.0) + 32, FAHRENHEIT)
            else
                return self
            end
        end
        
        # convert temperature to Kelvin
        def toK
            if @scale == CELSIUS
                return Temperature.new(@degree - 273.15, KELVIN)
            elsif @scale == FAHRENHEIT
                return Temperature.new((@degree - 32) * 5.0 / 9.0 + 273.15, KELVIN)
            else
                return self
            end
        end

        # convert temperature into another scale.
        def self.convert_temp(temp, scale)
            if temp.scale == scale
                return temp
            end
            if scale == CELSIUS
                return temp.toC
            elsif scale == KELVIN
                return temp.toK
            elsif scale == FAHRENHEIT
                return temp.toF
            end
        end

        # An input operation that lets a Temperature be conveniently input as a single entity (e.g., 98.6 F).
        def self.read_temp
            input = gets.chomp
            anArray = input.split(" ")
            if anArray.length() != 2
                return nil, true
            end
            scale = anArray[1][0]
            if not Temperature.is_scale_valid(scale) or not Temperature.is_numeric(anArray[0])
                return nil, true
            end
            degree = anArray[0].to_f
            return Temperature.new(degree, scale), false
        end

        # An output operation that lets a Temperature be displayed conveniently.
        def print_temp
            print to_string
        end

        # returns the temperature in a string
        # to_s: https://apidock.com/ruby/String/to_s
        # ljust(): https://apidock.com/ruby/v2_5_5/String/ljust
        def to_string
            return ("%.3f" % @degree).to_s.ljust(8) + " " + @scale
        end

        # given a Temperature and real degrees, returns a Temperature that is degrees higher than the Temperature received.
        def raise(i)
            return Temperature.new(@degree + i, scale)
        end

        # given a Temperature and a real degrees, returns a Temperature that is degrees lower than the Temperature received. 
        def lower(i)
            return Temperature.new(@degree - i, scale)
        end

        # given two Temperature operands, returns true if and only if the left operand is equal to the right operand.
        def equals(temp)
            return @degree == Temperature.convert_temp(temp, @scale).degree
        end

        # given two Temperature operands, returns true if and only if the left operand is less-than the right operand. 
        def less_than(temp)
            return @degree < Temperature.convert_temp(temp, @scale).degree
        end

        # check if the scale is valid
        def self.is_scale_valid(scale)
            upperCase = scale.upcase
            return upperCase == CELSIUS || upperCase == FAHRENHEIT || upperCase == KELVIN
        end

        # check if the string is numeric
        def self.is_numeric(degree)
            begin
                Float(degree)
            rescue
                false
            else
                true 
            end
        end
    end
end]0;gy24@remotel3: ~/cs214/projects/09/ruby[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ruby[00m$ cat temperature_tester.rb
# Test the temperature.rb and has the main function
# Author: David Yoo (gy24)
# Date: 03/22/2022

require './temperature'

def main
  puts "Temperature examples:"
  puts "\t20.5 C"
  puts "\t10 K"
  puts "\t35.1 F"
  print "Please enter a start temperature: "
  start, error = Temperatures::Temperature.read_temp
  while error
    print "Invalid input, please enter a valid input: "
    start, error = Temperatures::Temperature.read_temp
  end

  print " Please enter a stop temperature: "
  stop, error = Temperatures::Temperature.read_temp
  while error
    print "Invalid input, please enter a valid input: "
    stop, error = Temperatures::Temperature.read_temp
  end
  
  # NEED TO FIX THE PRINT MESSAGE, AND VARIABLE NAME
  print "Please enter a step amount of degrees: "
  step_string = gets.chomp
  step = 0.0
  while not Temperatures::Temperature.is_numeric(step_string)
    print "Invalid input, please enter a valid input: "
    step_string = gets.chomp
  end
  step = step_string.to_f

  if start.equals(stop)
    puts("Start and stop temperatures are equal.")
    return
  end
  
  current = start
  while true
    if start.less_than(stop) != current.less_than(stop) && !current.equals(stop)
      break
    end

    current.toF.print_temp
    print "\t\t"
    current.toC.print_temp
    print "\t\t"
    current.toK.print_temp
    puts ""

    if start.less_than(stop)
      current = current.raise(step)
    else
      current = current.lower(step)
    end
  end
end

main]0;gy24@remotel3: ~/cs214/projects/09/ruby[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ruby[00m$ ruby temperature_tester.rb
Temperature examples:
	20.5 C
	10 K
	35.1 F
Please enter a start temperature: 0 F
 Please enter a stop temperature: 100 C
Please enter a step amount of degrees: 2.5
0.000    F		-17.778  C		255.372  K
2.500    F		-16.389  C		256.761  K
5.000    F		-15.000  C		258.150  K
7.500    F		-13.611  C		259.539  K
10.000   F		-12.222  C		260.928  K
12.500   F		-10.833  C		262.317  K
15.000   F		-9.444   C		263.706  K
17.500   F		-8.056   C		265.094  K
20.000   F		-6.667   C		266.483  K
22.500   F		-5.278   C		267.872  K
25.000   F		-3.889   C		269.261  K
27.500   F		-2.500   C		270.650  K
30.000   F		-1.111   C		272.039  K
32.500   F		0.278    C		273.428  K
35.000   F		1.667    C		274.817  K
37.500   F		3.056    C		276.206  K
40.000   F		4.444    C		277.594  K
42.500   F		5.833    C		278.983  K
45.000   F		7.222    C		280.372  K
47.500   F		8.611    C		281.761  K
50.000   F		10.000   C		283.150  K
52.500   F		11.389   C		284.539  K
55.000   F		12.778   C		285.928  K
57.500   F		14.167   C		287.317  K
60.000   F		15.556   C		288.706  K
62.500   F		16.944   C		290.094  K
65.000   F		18.333   C		291.483  K
67.500   F		19.722   C		292.872  K
70.000   F		21.111   C		294.261  K
72.500   F		22.500   C		295.650  K
75.000   F		23.889   C		297.039  K
77.500   F		25.278   C		298.428  K
80.000   F		26.667   C		299.817  K
82.500   F		28.056   C		301.206  K
85.000   F		29.444   C		302.594  K
87.500   F		30.833   C		303.983  K
90.000   F		32.222   C		305.372  K
92.500   F		33.611   C		306.761  K
95.000   F		35.000   C		308.150  K
97.500   F		36.389   C		309.539  K
100.000  F		37.778   C		310.928  K
102.500  F		39.167   C		312.317  K
105.000  F		40.556   C		313.706  K
107.500  F		41.944   C		315.094  K
110.000  F		43.333   C		316.483  K
112.500  F		44.722   C		317.872  K
115.000  F		46.111   C		319.261  K
117.500  F		47.500   C		320.650  K
120.000  F		48.889   C		322.039  K
122.500  F		50.278   C		323.428  K
125.000  F		51.667   C		324.817  K
127.500  F		53.056   C		326.206  K
130.000  F		54.444   C		327.594  K
132.500  F		55.833   C		328.983  K
135.000  F		57.222   C		330.372  K
137.500  F		58.611   C		331.761  K
140.000  F		60.000   C		333.150  K
142.500  F		61.389   C		334.539  K
145.000  F		62.778   C		335.928  K
147.500  F		64.167   C		337.317  K
150.000  F		65.556   C		338.706  K
152.500  F		66.944   C		340.094  K
155.000  F		68.333   C		341.483  K
157.500  F		69.722   C		342.872  K
160.000  F		71.111   C		344.261  K
162.500  F		72.500   C		345.650  K
165.000  F		73.889   C		347.039  K
167.500  F		75.278   C		348.428  K
170.000  F		76.667   C		349.817  K
172.500  F		78.056   C		351.206  K
175.000  F		79.444   C		352.594  K
177.500  F		80.833   C		353.983  K
180.000  F		82.222   C		355.372  K
182.500  F		83.611   C		356.761  K
185.000  F		85.000   C		358.150  K
187.500  F		86.389   C		359.539  K
190.000  F		87.778   C		360.928  K
192.500  F		89.167   C		362.317  K
195.000  F		90.556   C		363.706  K
197.500  F		91.944   C		365.094  K
200.000  F		93.333   C		366.483  K
202.500  F		94.722   C		367.872  K
205.000  F		96.111   C		369.261  K
207.500  F		97.500   C		370.650  K
210.000  F		98.889   C		372.039  K
]0;gy24@remotel3: ~/cs214/projects/09/ruby[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/09/ruby[00m$ exit

Script done on 2022-03-23 19:45:04-04:00 [COMMAND_EXIT_CODE="0"]
