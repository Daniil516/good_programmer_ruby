require "json"

json_file = File.read("business_card.json")
data_hash = JSON.parse(json_file)

puts "#{data_hash["name"]} #{data_hash["middle-name"].chars.first}. #{data_hash["surname"]}"
puts "#{data_hash["number"]}, #{data_hash["email"]}"
puts data_hash["position"]