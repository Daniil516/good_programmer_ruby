require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/album"
require_relative "lib/shopping_session"
require_relative "lib/product_collection"

product_list = ProductCollection.from_dir
user_session = ShoppingSession.new
PRODUCT_RANGE = 0..product_list.to_a.length

begin
  user_session.print_main_interface(product_list)

  user_choice = $stdin.gets.to_i - 1
  if  (PRODUCT_RANGE).include?(user_choice)
    chosen_product = product_list.to_a[user_choice]

    chosen_product.update(amount: - 1)
    user_session.add_new_purchase(chosen_product)
    puts "You chose: #{chosen_product}"
    puts "Total price: #{user_session.total_price} $"
  end
end until user_choice == -1

puts "You bought:\n\n"
puts user_session.to_a
puts "\nTotal price: #{user_session.total_price}$. Thanks for shopping! "



