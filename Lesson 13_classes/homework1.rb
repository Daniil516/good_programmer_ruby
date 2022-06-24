if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

class Book

  def initialize(name, writer, year)
    @name = name
    @writer = writer
    @year = year
  end

  def name
    return @name
  end

  def writer
    return @writer
  end

  def year
    return @year
  end
end

a = Book.new("1984", "Orwell", "1949")
puts "Название: #{a.name}"
puts "Автор: #{a.writer}"
puts "Год публикации: #{a.year}"
