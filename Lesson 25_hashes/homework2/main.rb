tickets = [
  {
    :ticket_num => "323-654-22-1",
    :route => "Moscow-Istanbul",
    :passenger => "Grishchenko D. G.",
    :passport => "43 12 133577"
  },
  {
    :ticket_num => "456-322-22-2",
    :route => "Moscow-Ankara",
    :passenger => "Vitalenko B. E.",
    :passport => "33 17 100624"
  },
  {
    :ticket_num => "456-324-22-3",
    :route => "Moscow-Paris",
    :passenger => "Trofenuk P. A.",
    :passport => "10 05 333871"
  }
]

#Выводим инф-у об отдельном пассажире
tickets.each_with_index do |ticket, index|
  puts "\n***SEAT №#{index}***"
  ticket.each do |key, value|
    puts "#{key}: #{value}"
  end
end