require "json"

file = File.read("programmers.json")
languages = JSON.parse(file)

#Sorting languages by popularity
languages_by_popularity = languages.sort_by { |key, value| value  }.reverse

puts "Most popular language is #{languages_by_popularity[0][0]} (#{languages_by_popularity[0][1]})"

languages_by_popularity.each.with_index(1) do |lang, index|
  puts "#{index}: #{lang[0]} (#{lang[1]})"
end
