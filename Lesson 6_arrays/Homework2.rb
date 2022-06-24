array = [1, 2, 3, 4, 5]
puts "Исходный массив: \n #{array.to_s}"
puts "Массив в обратном порядке: \n #{array.reverse.to_s}"
puts "Исходный массив(не изменился): \n #{array.to_s}"
puts "Массив в обратном порядке: \n #{array.reverse!.to_s}"
