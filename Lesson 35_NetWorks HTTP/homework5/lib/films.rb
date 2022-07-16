require "net/http"
require "uri"
require "nokogiri"
require "open-uri"

class Films
  def initialize(path)
    @collection = get_collection_from(path)
  end

  def get_from_link(path)
    # Fetch and parse HTML document
    doc = Nokogiri::HTML(URI.open("https://www.kinopoisk.ru/lists/movies/top500/"))

    # Search for nodes by css
    doc.css('article h2').each do |link|
      puts link.content
    end
  end

  def all_directors
    @collection.map(&:director).uniq
  end

  def all_directors_print
    all_directors.each.with_index(1) do |director, index|
      "#{index}: #{director}"
    end
  end

  def to_recomend(user_director)
    @collection.select { |film| film.director == user_director }.sample
  end
end