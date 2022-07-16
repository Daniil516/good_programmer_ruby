require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
uri = URI.open("https://www.imdb.com/list/ls055592025/")
doc = Nokogiri::HTML(uri)

# names
film_names = doc.css(".lister-item-content h3 a").map { |name| name.text  }
pp film_names



