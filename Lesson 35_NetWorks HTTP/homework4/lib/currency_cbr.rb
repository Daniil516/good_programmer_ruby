require "net/http"
require "uri"
require "rexml/document"
require "rexml/xpath"

class CurrencyCBR
  attr_reader :available_currencies
  def initialize
    @doc = CurrencyCBR.get_xml_from_link
    @available_currencies = get_available_currencies
  end

  def one_currency_rate(currency_abbrev)
    @available_currencies[currency_abbrev].to_f
  end

  private

  def self.get_xml_from_link
    #Creating uri object from data link
    uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")
    #request type GET to server
    response = Net::HTTP.get_response(uri)
    #Parsing request body to xml format in ruby
    REXML::Document.new(response.body)
  end

  #getting all currencies in that way: {:currency_type => its rate, :currency_type2 => its rate, ...}
  def get_available_currencies
    currencies_hash = {}
    REXML::XPath.each(@doc, "*/Valute") do |currency|
      currencies_hash[currency.elements["CharCode"].text.to_sym] =
        currency.elements["Value"].text.gsub(/[,]/, ".").to_f
    end
    currencies_hash
  end
end