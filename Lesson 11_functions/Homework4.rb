if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def mix_sentence(sentence)
  words = sentence.split(" ")
  return (words.map {|word| word = word.chars.shuffle.join}).join(" ")
end

puts "Введите фразу:"
puts mix_sentence(gets.chomp)

