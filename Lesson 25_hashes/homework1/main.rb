tickets = {
  :ticket_num => "323-654-22-1",
  :route => "Moscow-Istanbul",
  :passenger => "Grishchenko D. G.",
  :passport => "43 12 133577"
}
tickets.each do  |key, value|
  puts "#{key}: #{value}"
end
