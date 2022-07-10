require "json"

file = File.read("the_periodic_table.json")
table = JSON.parse(file)

# Printing amount of elements
puts "We have #{table.keys.size} elements"

# Printing elements
puts table.keys.join(", ")

puts "What element do you want to know about?"
element = gets.chomp

# Проверка — есть ли в хэше элемент, который спросил пользователь
if table.key?(element)
  puts "The discoverer of this element: #{table[element]}"
else
  puts "I am sorry. I do now know about such element yet..."
end
