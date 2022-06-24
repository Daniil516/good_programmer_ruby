def count_vowels_and_consonants(word)
  vowels = word.downcase.chars.count {|char| "aoeuiy".include?(char)}
  consonants = word.downcase.chars.count {|char| !("aoeuiy".include?(char))}
  return [vowels, consonants]
end

puts "Enter the word:"
vowels_and_consonants = count_vowels_and_consonants(gets.chomp)

puts "Vowels: #{vowels_and_consonants[0]}"
puts "Consonants: #{vowels_and_consonants[1]}"
