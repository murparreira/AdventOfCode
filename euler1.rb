range = 1..999

multiples = []
range.each do |number|
  if number % 3 == 0 || number % 5 == 0
    multiples << number
  end
end

puts "The sum of all multiples of 3 and 5 below 1000 is #{multiples.sum}"