class Product
  attr_accessor :name, :price, :amount_on_warehouse
  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @amount_on_warehouse = params[:amount_on_warehouse]
  end

  def self.get_types
    {"books" => Book, "films" => Film, "albums" => Album}
  end

  def update(params)
    @name = params[:name] if params[:name]
    @price = params[:price] if params[:price]
    @amount_on_warehouse += params[:amount] if params[:amount]
  end

  def self.from_file(path)
    raise "NotImplementedError"
  end

  def to_s
    "price: #{@price}$. (warehouse: #{@amount_on_warehouse})"
  end
end
