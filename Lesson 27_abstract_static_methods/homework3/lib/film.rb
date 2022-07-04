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

  def self.from_file(path)
    file_strings = File.readlines(path, mode: "r", encoding: "UTF-8", chomp: true)
    self.new({name: file_strings[0], director: file_strings[1], year: file_strings[2].to_i,
              price: file_strings[3].to_i, amount_on_warehouse: file_strings[4].to_i})
  end

  def to_s
    "Film: #{@name}, year: #{@year}, director: #{@director}, #{super}"
  end
end