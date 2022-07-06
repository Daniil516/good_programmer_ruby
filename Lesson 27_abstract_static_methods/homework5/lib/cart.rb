class Cart
  def initialize
    @shopping_list = []
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