require "json"

json_string = File.read("#{__dir__}/the_periodic_table.json")
table = JSON.parse(json_string, symbolize_names: true)

# Printing amount of elements
puts "We have #{table.size} elements"

# Printing elements
puts table.keys.join(", ")

puts "What element do you want to know about?"
element = $stdin.gets.chomp.downcase.capitalize.to_sym

# Check if program has element
unless table.key?(element)
  puts "I am sorry. I do now know about such element yet..."
  exit
end

hash_info = table[element]
puts <<~ELEMENT_INFO
  Table number: #{hash_info[:table_number]}
  Name: #{hash_info[:name]}
  Discoverer: #{hash_info[:discoverer]} (#{hash_info[:year]} y.)
  Density: #{hash_info[:density]} g/cm³
ELEMENT_INFO
