class Product
  attr_writer :name, :price, :amount_on_warehouse
  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @amount_on_warehouse = params[:amount_on_warehouse]
  end

  def update(params)
    @name = params[:name] if params[:name]
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def to_s
    #abstract
  end
end