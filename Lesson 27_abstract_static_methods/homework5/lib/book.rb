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

  def self.from_file(path)
    file_strings = File.readlines(path, mode: "r", encoding: "UTF-8", chomp: true)
    self.new({name: file_strings[0], genre: file_strings[1], author: file_strings[2],
                     price: file_strings[3].to_i, amount_on_warehouse: file_strings[4].to_i})
  end

  def to_s
    "Book: #{@name}, #{@genre}, author - #{@author}, #{super}"
  end
end
