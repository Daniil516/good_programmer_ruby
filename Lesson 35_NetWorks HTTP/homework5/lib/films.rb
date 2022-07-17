require "net/http"
require "uri"
require "nokogiri"
require "open-uri"

class Films
  def initialize(collection)
    @collection = collection
  end

  def self.get_from_link(path)
    #getting data
    unless File.exist?(path)
      doc = Nokogiri::HTML(URI.open("https://www.kinopoisk.ru/lists/movies/top500/"))
      File.write(path, doc)
    end
    doc = File.open(path) { |f| Nokogiri::XML(f) }

    #parsing every film block info to film objects
    collection = doc.css(".styles_root__ti07r").map do |film_block|
      film_name = film_block.css("a span").first.text
      film_year = film_block.css(".desktop-list-main-info_secondaryText__M_aus").first.text.match(/\d{4}/)
      film_director = film_block.css(".desktop-list-main-info_truncatedText__IMQRP").first.text.match(/:\s[А-Я\sа-я]+/)

      Film.new(film_name, film_director.to_s.gsub(/:\s/, ""), film_year.to_s)
    end

    Films.new(collection)
  end

  def all_directors
    @collection.map(&:director).uniq
  end

  def all_directors_print
    all_directors.map.with_index(1) do |director, index|
      "#{index}: #{director}"
    end
  end

  def to_recomend(user_director)
    @collection.select { |film| film.director == user_director }.sample
  end
end
