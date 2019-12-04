def calculate_fuel(mass)
  return (mass / 3) - 2
end

def calculate_additional_fuel(fuel)
  additional = calculate_fuel(fuel)
  if additional <= 0
    return 0
  end
  return additional + calculate_additional_fuel(additional)
end

modules = File.readlines('day_1_input.txt');
fuel_for_modules = 0

modules.each do |mass|
  fuel = calculate_fuel(Integer(mass))
  additional = calculate_additional_fuel(fuel)
  fuel_for_modules += fuel + additional
end

puts fuel_for_modules