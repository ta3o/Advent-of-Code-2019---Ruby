def run_program(program, startAt = 0)
  opcode = program[startAt]
  left = program[startAt + 1]
  right = program[startAt + 2]
  position = program[startAt + 3]

  case opcode
  when 1
    program[position] = program[left] + program[right]
    return run_program(program, startAt + 4)
  when 2
    program[position] = program[left] * program[right]
    return run_program(program, startAt + 4)
  when 99
    return program
  else
    return puts 'something went wrong'
  end
end

program = File.read('day_2_input.txt')
  .split(',')
  .map {|v| v.to_i}

noun = 0
verb = 0

for x in 0..99 do
  noun = x
  stop = false
  for y in 0..99 do
    verb = y
    new_program = program.clone
    new_program[1] = x
    new_program[2] = y
    output = run_program(new_program)

    if output[0] == 19690720
      stop = true
      break
    end
  end

  if stop
    break
  end
end

result = 100 * noun + verb

puts result
