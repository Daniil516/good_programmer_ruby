puts "Какой длины будет массив случайных чисел?"
array_length = gets.to_i
index = 0
array = []
while index < array_length
  array << rand(101)
  index += 1
end
puts array.to_s
puts "Самое большое число: #{array.max}"
