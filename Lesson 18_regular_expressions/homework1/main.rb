if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите email:"
user_email = $stdin.gets.chomp
if user_email =~ /^[\w+.\-]+\.?[\w+.\-]+@gmail.[a-z]+$/
  puts "Спасибо!"
else
  puts "Неподходящий email"
end
