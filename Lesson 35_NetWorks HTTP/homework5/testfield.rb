require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = File.open("#{__dir__}/data/the_best_films.html") { |f| Nokogiri::XML(f) }

a = doc.css(".styles_root__ti07r").map do |film_block|
  #film_name
  puts film_block.css("a span").first.text
  #year
  puts film_block.css(".desktop-list-main-info_secondaryText__M_aus").first.text.match(/\d{4}/)
  #director
  a = film_block.css(".desktop-list-main-info_truncatedText__IMQRP").first.text.match(/:\s[А-Я\sа-я]+/)
  puts a.to_s.gsub(/:\s/, "")
end
puts a




