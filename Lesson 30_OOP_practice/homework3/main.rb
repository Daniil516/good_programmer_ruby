require_relative "lib/item_of_clothing"
require_relative "lib/clothes_collection"

all_clothes_by_types = ClothesCollection.get_clothes_by_types("#{__dir__}/data")

puts "What is the temperature outside?(Celsius)"
temperature_outside = $stdin.gets.to_i

puts "We suggest you wear today:"
all_clothes_by_types.each_key do |type|#puts one item from each type if it is in required temperature
  item = all_clothes_by_types[type].detect {|item| item.temperature.include?(temperature_outside) }
  puts item unless item.nil?
end