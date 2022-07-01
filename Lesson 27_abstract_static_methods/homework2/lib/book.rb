class Book < Product
  attr_writer :genre, :author
  def initialize(params)
    super
    @genre = params[:genre]
    @author = params[:author]
  end

  def update(params)
    super
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  def to_s
    "Book: #{@name}, #{@genre}, author - #{@author}, price: #{@price}$. (warehouse: #{@amount_on_warehouse})"
  end
end
