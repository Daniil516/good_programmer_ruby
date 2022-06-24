array = (0..7).to_a
inverted_array = []
index = array.length - 1
while index !=0
  inverted_array << index
  index -= 1
end
puts "Исходный массив: \n #{array.to_s}"
puts "Новый массив, полученный из исходного:"
puts inverted_array.to_s
