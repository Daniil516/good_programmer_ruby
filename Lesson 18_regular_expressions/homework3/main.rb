if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите строку с хэштегами:"
user_input = $stdin.gets.chomp
if user_input =~ /#[[:word:]\-]+/#Первый знак - "#", далее - любая буква(ы), цифра(ы) + нижнее подчеркивание
  print "Нашли вот такие хэштеги:#{user_input.scan(/#[[:word:]\-]+/).join(", ")}"#.scan для вывода совпадений
else
  puts "В вашей строке нет хэштегов"
end
