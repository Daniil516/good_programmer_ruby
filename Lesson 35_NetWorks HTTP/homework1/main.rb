#Getting forecast from this site
# http://www.meteoservice.ru/content/export.html

require 'uri'
require 'net/http'
require 'rexml/document'

CLOUDINESS = %w[clear low_clouds cloudy very_cloudy].freeze
# http://www.meteoservice.ru/content/export.html
# Parsing link to uri(site address)
uri = URI.parse('https://www.meteoservice.ru/en/export/gismeteo?point=37')#37 - Moscow code
#GET request to site
response = Net::HTTP.get_response(uri)

# Parsing body response(html) to xml
doc = REXML::Document.new(response.body)

# Получаем имя города из XML, город лежит в ноде REPORT/TOWN
city_name = URI.decode_www_form_component(
  doc.root.elements['REPORT/TOWN'].attributes['sname']
)


forecast = doc.root.elements['REPORT/TOWN/FORECAST[2]']


min_temp = forecast.elements['TEMPERATURE'].attributes['min']
max_temp = forecast.elements['TEMPERATURE'].attributes['max']


max_wind = forecast.elements['WIND'].attributes['max']

clouds_index = forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i
clouds = CLOUDINESS[clouds_index]


puts "Tommorow in #{city_name}"
puts "Temperature — between #{min_temp} to #{max_temp} С"
puts "Wind #{max_wind} m/s"
puts clouds
