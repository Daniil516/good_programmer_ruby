puts "Введите N"
times = gets.to_i
i = 0
answer = 0
array = []
while i < times
  i+= 1
  array << i
  answer += i
end
puts array.to_s
puts "Сумма чисел: #{answer}"
