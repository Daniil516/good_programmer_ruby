require "date"
require "rexml/document"
require_relative "lib/wish"
#In this program I sort wishes from file by it's date: That should have been fulfilled and that is shouldn't

#reading xml doc
file = File.new("#{__dir__}/data/wishes.xml", "r:UTF-8")
doc = REXML::Document.new(file)

#parsing all elements from doc to wish-class array
wishes = doc.get_elements("wishes/wish").map { |xml_wish| Wish.new(xml_wish)}

puts "These wishes should have fulfilled by this day:"
wishes.each {|wish| puts wish.to_s if wish.fulfilled?}

puts "\nThese wishes will have fulfilled some day:"
wishes.each {|wish| puts wish.to_s unless wish.fulfilled?}