require "rexml/document"

file = File.new("#{__dir__}/business_card.xml")
xml_doc = REXML::Document.new(file)
xml_elements = Hash.new
["name", "sur_name", "middle_name", "phone_number", "email", "post"].each do |element|
  xml_elements[element] = xml_doc.root.elements[element].text
end


puts <<~OUTPUT
#{xml_elements["name"]} #{xml_elements["middle_name"].chars.first}. #{xml_elements["sur_name"]}
#{xml_elements["phone_number"]}, #{xml_elements["email"]}
#{"post"}
OUTPUT
