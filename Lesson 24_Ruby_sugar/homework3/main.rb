(1..100).each do |i|
    if i % 5 == 0 && i % 3 == 0
      puts "тыры-пыры"
    else
      puts "тыры" if i % 3 == 0
      puts i % 5 == 0 ?  "пыры" :  i
    end
end