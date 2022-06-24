def count_vowels(word)
  word.downcase.chars.count {|char| "aoeuiy".include?(char)}
end
puts "Enter the word:"
puts "Vowels: #{count_vowels(gets.chomp)}"
