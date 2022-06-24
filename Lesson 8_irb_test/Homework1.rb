if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

original_string = gets.downcase.chomp.delete(" ,.")

reverse_string = original_string.reverse

if reverse_string == original_string
  puts "Да, это палиндром"
else
  puts "Нет, это не палиндром"
end
