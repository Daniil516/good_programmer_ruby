require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/album"
require_relative "lib/cart"
require_relative "lib/product_collection"

product_list = ProductCollection.from_dir(__dir__)
user_card = Cart.new
PRODUCT_RANGE = 0..product_list.size

loop do
  puts "What do you want to buy?"
  puts product_list
  puts "0. Exit"

  user_choice = $stdin.gets.to_i
  if  (PRODUCT_RANGE).include?(user_choice)
    chosen_product = product_list.product_by_index(user_choice)

    chosen_product.amount -= 1
    user_card.add_new_purchase(chosen_product)
    puts "You chose: #{chosen_product}"
    puts "Total price: #{user_card.total_price} $"
  end
  break if user_choice == 0
end

puts "You bought:\n\n"
puts user_card.to_a.empty? ? "nothing" : user_card
puts "\nTotal price: #{user_card.total_price}$. Thanks for shopping! "
