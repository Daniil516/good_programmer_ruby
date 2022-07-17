module FilmParser
  extend self

  KINOPOISK_URL = "https://www.kinopoisk.ru/lists/movies/top500/"

  def from_kinopoisk(path)
    unless File.exist?(path)
      doc = Nokogiri::HTML(URI.open(KINOPOISK_URL))
      File.write(path, doc)
    end
    #parsing every film block info to film objects
    doc = File.open(path) { |f| Nokogiri::XML(f) }

    collection = doc.css(".styles_root__ti07r").map do |film_block|
      name = film_block.css("a span").first.text
      year = film_block.css(".desktop-list-main-info_secondaryText__M_aus").first.text.match(/\d{4}/)
      director = film_block.css(".desktop-list-main-info_truncatedText__IMQRP").first.text.match(/:\s[А-Я\sа-я]+/)

      Film.new(name, director.to_s.gsub(/:\s/, ""), year.to_s)
    end
    FilmCollection.new(collection)
  end
end
