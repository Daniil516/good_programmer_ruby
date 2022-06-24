if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def declination(number, form1, form2, form3)
  if (10..20).include?(number % 100)
    puts "Вам #{number} #{form3}"
  elsif number % 10 == 1
    puts "Вам #{number} #{form1}"
  elsif (2..4).include?(number % 10)
    puts "Вам #{number} #{form2}"
  else
    puts "Вам #{number} #{form3}"
  end
end
puts "Сколько вам плакатов?"
puts declination(gets.to_i, "плакат", "плаката", "плакатов")
