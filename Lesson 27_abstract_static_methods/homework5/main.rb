require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/album"
require_relative "lib/cart"
require_relative "lib/product_collection"

product_list = ProductCollection.from_dir(__dir__)
user_card = Cart.new
PRODUCT_RANGE = 0..product_list.to_a.length

loop do
  puts "What do you want to buy?"
  puts product_list.to_s
  puts "0. Exit"

  user_choice = $stdin.gets.to_i - 1
  if  (PRODUCT_RANGE).include?(user_choice)
    chosen_product = product_list.product_by_index(user_choice)

    chosen_product.update(amount: -1)
    user_card.add_new_purchase(chosen_product)
    puts "You chose: #{chosen_product}"
    puts "Total price: #{user_card.total_price} $"
  end
  break if user_choice == -1
end

puts "You bought:\n\n"
puts user_card.to_a.empty? ? "nothing" : user_card.to_a
puts "\nTotal price: #{user_card.total_price}$. Thanks for shopping! "
