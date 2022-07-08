class Product
  attr_accessor :name, :price, :amount

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @amount = params[:amount]
  end

  def update(params)
    @name = params[:name] if params[:name]
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def self.from_file(path)
    raise "NotImplementedError"
  end

  def to_s
    "price: #{@price}$. (warehouse: #{@amount})"
  end
end
