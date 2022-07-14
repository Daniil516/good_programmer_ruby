require "net/http"
require "uri"
require "rexml/document"

#Creating uri object from data link
uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")
#request type GET to server
response = Net::HTTP.get_response(uri)
#Parsing request body to xml format in ruby
doc = REXML::Document.new(response.body)

#getting usd to rub from xml document
usd_element = doc.root.elements["Valute[@ID = \"R01235\"]"]
#getting eur to rub from xml document
eur_element = doc.root.elements["Valute[@ID = \"R01239\"]"]

puts "Here you can check current rub rate to usd and eur rates:"
puts "1 USD: #{usd_element.elements["Value"].text} rub."
puts "1 EUR: #{eur_element.elements["Value"].text} rub."