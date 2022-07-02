class Film < Product
  attr_writer :year, :director
  def initialize(params)
    super
    @year = params[:year]
    @director = params[:director]
  end

  def update(params)
    super
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def to_s
    "Film: #{@name}, year: #{@year}, director: #{@director}, price: #{@price}$. (warehouse: #{@amount_on_warehouse})"
  end
end