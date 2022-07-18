module FilmParser
  extend self

  KINOPOISK_URL = "https://www.kinopoisk.ru/lists/movies/top500/"

  def from_kinopoisk
    unless File.exist?("#{__dir__}/../data/kinopoisk.html")
      doc = Nokogiri::HTML(URI.open(KINOPOISK_URL))
      File.write("#{__dir__}/../data/kinopoisk.html", doc)
    end
    #parsing every film block info to film objects
    doc = File.open("#{__dir__}/../data/kinopoisk.html") { |f| Nokogiri::XML(f) }

    collection = doc.css(".styles_root__ti07r").map do |film_block|
      name = film_block.css("a span").first.text
      year = film_block.css(".desktop-list-main-info_secondaryText__M_aus").first.text.match(/\d{4}/)
      director = film_block.css(".desktop-list-main-info_truncatedText__IMQRP").first.text.match(/:\s[А-Я\sа-я]+/)

      Film.new(name, director.to_s.gsub(/:\s/, ""), year.to_s.to_i)
    end
    FilmCollection.new(collection)
  end
end
