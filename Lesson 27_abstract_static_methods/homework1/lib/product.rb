class Product
  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @amount_on_warehouse = params[:amount_on_warehouse]
  end

  def self.get_type
    [Book, Film]
  end

  def self.create(type_num, params)
    get_type[type_num].new(params)
  end

  def to_s
    #abstract
  end
end