class Album < Product
  attr_writer :genre, :artist, :year
  def initialize(params)
    super
    @genre = params[:genre]
    @artist = params[:artist]
    @year = params[:year]
  end

  def update(params)
    super
    @genre = params[:genre] if params[:genre]
    @artist = params[:artist] if params[:artist]
    @year = params[:year] if params[:year]
  end

  def self.from_file(path)
    file_strings = File.readlines(path, mode: "r", encoding: "UTF-8", chomp: true)
    self.new({ name: file_strings[0], artist: file_strings[1], genre: file_strings[2],
               year: file_strings[3].to_i, price: file_strings[4].to_i, amount_on_warehouse: file_strings[5].to_i})
  end

  def to_s
    "Album #{@artist} - \"#{@name}\", #{@genre}, #{@year}, #{super}"
  end
end
