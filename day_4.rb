start_at, end_at = [382345, 843167]
passwords = []

for x in start_at..end_at
  digits = x.to_s.split('')
  min = digits[0].to_i
  digit_count = Array.new(10, 0)
  is_valid = true

  digits.each do |digit|
    if digit.to_i >= min
      digit_count[digit.to_i] += 1
      min = digit.to_i
    else
      is_valid = false
      break
    end
  end

  if is_valid
    if digits.uniq!
      if digit_count.compact.include? 2
        passwords.push(x)
      end
    end
  end
end

result = passwords.length

puts result
