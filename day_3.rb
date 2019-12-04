def get_coordinates(path)
  x = 0
  y = 0
  points = path.split(',')
  coordinates = []

  points.each do |point|
    direction = point[0]
    value = point[1..-1].to_i

    case direction
    when "U"
      for z in 1..value
        coordinates.push([x, y + z])
      end
      y += value
    when "D"
      for z in 1..value
        coordinates.push([x, y - z])
      end
      y -= value
    when "L"
      for z in 1..value
        coordinates.push([x - z, y])
      end
      x -= value
    when "R"
      for z in 1..value
        coordinates.push([x + z, y])
      end
      x += value
    end
  end

  return coordinates
end

def calculate_steps (path, intersection)
  x = 0
  y = 0
  points = path.split(',')
  steps = 0

  points.each do |point|
    direction = point[0]
    value = point[1..-1].to_i

    case direction
    when "U"
      for z in 1..value
        steps += 1
        y += 1
        if [x, y] == intersection
          return steps
        end
      end
    when "D"
      for z in 1..value
        steps += 1
        y -= 1
        if [x, y] == intersection
          return steps
        end
      end
    when "L"
      for z in 1..value
        steps += 1
        x -= 1
        if [x, y] == intersection
          return steps
        end
      end
    when "R"
      for z in 1..value
        steps += 1
        x += 1
        if [x, y] == intersection
          return steps
        end
      end
    end
  end
end

paths = File.readlines('day_3_input.txt');

path_a = paths[0]
path_b = paths[1]

instersections = get_coordinates(path_a) & get_coordinates(path_b)

steps = []

instersections.each do |intersection|
  steps_for_a = calculate_steps(path_a, intersection)
  steps_for_b = calculate_steps(path_b, intersection)
  steps.push(steps_for_a + steps_for_b)
end

puts steps.min
