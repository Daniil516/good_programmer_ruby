#Read about erb https://senior.ua/articles/chto-takoe-erb-v-rails-i-kak-ego-osvoit
require "erb"

puts "This program will create business card with given data."
puts "Enter your name and surname:"
name_surname = $stdin.gets.chomp

puts "Enter your post:"
post = $stdin.gets.chomp

puts "Enter url of your photo:"
image_url = $stdin.gets.chomp

puts "Enter your phone number:"
phone_number= $stdin.gets.chomp

puts "Enter your email"
email = $stdin.gets.chomp

template = File.read("#{__dir__}/data/template.html.erb")
business_card = ERB.new(template).result(binding)

path_to_new_business_card = "#{__dir__}/data/user_business_cards/#{Time.now}.html"

File.write(path_to_new_business_card, business_card)

puts "Your file was saved in #{path_to_new_business_card}" if File.exist?(path_to_new_business_card)

