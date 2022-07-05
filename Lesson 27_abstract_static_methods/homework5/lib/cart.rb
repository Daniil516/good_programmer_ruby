class Cart
  def initialize
    @shopping_list = []
  end

  def main_interface(product_list)
    interface = ["What do you want to buy?"]
    interface << product_list.to_a.map.with_index(1) {|product, index| "#{index}. #{product}" }
    interface << "0. Exit"
  end

  def add_new_purchase(purchase)
    @shopping_list << purchase
  end

  def total_price
    @shopping_list.sum(&:price)
  end

  def to_a
    @shopping_list
  end
end