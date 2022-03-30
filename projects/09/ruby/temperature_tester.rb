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

main