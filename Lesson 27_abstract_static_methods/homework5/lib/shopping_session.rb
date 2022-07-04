class ShoppingSession
  def initialize
    @shopping_list = []
  end

  def print_main_interface(product_list)
    puts "What do you want to buy?"
    product_list.to_a.each.with_index(1) { |product, index| puts "#{index}. #{product}" }
    puts "0. Exit"
  end

  def add_new_purchase(purchase)
    @shopping_list << purchase
  end

  def total_price
    @shopping_list.map(&:price).inject(0, :+)
  end

  def to_a
    if @shopping_list.empty?
      "nothing"
    else
      @shopping_list
    end
  end
end