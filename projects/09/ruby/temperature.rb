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
end