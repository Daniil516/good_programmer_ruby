require 'open-uri'
require 'json'

def random_cat_fact
  data = URI.open("https://catfact.ninja/fact").read
  json = JSON.parse(data)

   return json["fact"]
end

puts "Привет великий спутник."
puts "Сколько фактов о прекрасных животных мира сего - котах, желаешь получить?"
gets.to_i.times do
  puts random_cat_fact
end
