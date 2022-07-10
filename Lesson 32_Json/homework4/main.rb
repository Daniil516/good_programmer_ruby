require "json"

file = File.read("the_periodic_table.json")
table = JSON.parse(file)

# Printing amount of elements
puts "We have #{table.keys.size} elements"

# Printing elements
puts table.keys.join(", ")

puts "What element do you want to know about?"
element = gets.chomp

# Check if program has element
unless table.key?(element)
  puts "I am sorry. I do now know about such element yet..."
  exit
end

hash_info = table[element]
puts <<~ELEMENT_INFO
Table number: #{hash_info["table_number"]}
Name: #{hash_info["name"]}
Discoverer: #{hash_info["discoverer"]} (#{hash_info["year"]} y.)
Density: #{hash_info["density"]} g/cm³
ELEMENT_INFO
