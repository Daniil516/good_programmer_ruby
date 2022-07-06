require "date"
require "rexml/document"

puts "There are wishes in this chest..."
sleep(2)
puts "What do you want?"
user_wish = $stdin.gets.chomp

puts "By what date do you want to fulfill this wish?(specify the date in the format DD.MM.YYYY)"
user_wish_date = $stdin.gets.chomp

#Reading xml file
file = File.new("#{__dir__}/wishes.xml", "r:UTF-8")
doc = REXML::Document.new(file)
file.close

#Searching root element where we want to add child-element
root_element = doc.elements.find("wishes").first

#Adding element with "date" attribute
new_wish = root_element.add_element "wish", {"date" => user_wish_date}
#Adding text to element
new_wish.text = user_wish

#Saving changes
file = File.new("#{__dir__}/wishes.xml", "w:UTF-8")
doc.write(file, 1)#second argument - distance between elements
file.close

puts "Your wish has been fully recorded"
