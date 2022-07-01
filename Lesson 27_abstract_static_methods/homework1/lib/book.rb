class Book < Product
  def initialize(params)
    super
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Book: #{@name}, #{@genre}, author - #{@author}, price: #{@price}$. (warehouse: #{@amount_on_warehouse})"
  end
end
