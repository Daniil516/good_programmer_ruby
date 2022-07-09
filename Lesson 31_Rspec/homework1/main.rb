require_relative "lib/hashtags_finder"

puts "Enter the sentence with hashtags:"
user_input = $stdin.gets.chomp

if user_input =~ /#[[:word:]\-]+/#First letter - "#", next - any letters, numbers or "_"
  print "Found these hashtags: #{HashTagsFinder.find_hashtags(user_input).join(", ")}"
else
  puts "You don't have any hashtags in sentence"
end
