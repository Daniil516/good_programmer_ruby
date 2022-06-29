(1..100).each do |number|
    if (number % 5).zero? && (number % 3).zero?
      puts "тыры-пыры"
    elsif (number % 3).zero?
      puts "тыры"
    elsif (number % 5).zero?
      puts "пыры"
    else
      puts number
    end
end