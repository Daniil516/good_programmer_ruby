require "translit"
#Гем транслитерации: https://github.com/tjbladez/translit

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
print "Введите фразу для транслитерации: "
puts Translit.convert($stdin.gets.chomp)
