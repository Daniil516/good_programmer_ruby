if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите номер телефона:"
puts $stdin.gets.chomp.gsub(/[\s+\-()]/, "") =~ /^\d{8,18}$/ ? "Спасибо!" : "Это не номер телефона!"
#regex: Проверяются исключительно цифры. Символы не имеют значения

