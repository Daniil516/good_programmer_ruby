class Product
  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @amount_on_warehouse = params[:amount_on_warehouse]
  end

  def to_s
    #abstract
  end
end