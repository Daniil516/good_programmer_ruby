require_relative "lib/item_of_clothing"
require_relative "lib/clothes_collection"

#all_clothes_by_types = ClothesCollection.get_clothes_by_types("#{__dir__}/data")
collection = ClothesCollection.from_dir("#{__dir__}/data")

puts "What is the temperature outside?(Celsius)"
temperature = $stdin.gets.to_i

puts "We suggest you wear today:"
advices_clothes = collection.for_weather(temperature)

puts advices_clothes