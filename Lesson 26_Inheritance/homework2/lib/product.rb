class Product
  attr_reader :price, :amount_on_warehouse

  def initialize(params)
    @price = params[:price]
    @amount_on_warehouse = params[:amount_on_warehouse]
  end
end