def mix_word(word)
  return word.chars.shuffle.join
end

puts "Введите слово:"
puts mix_word(gets.chomp)
