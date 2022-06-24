guessednumber = rand(16)
puts "Загадано число от 0 до 15, отгадайте какое?"
3.times do
  usernumber = gets.to_i
  if usernumber == guessednumber
    puts "Ура, вы выиграли!"
    exit
  end
  if (guessednumber - usernumber).abs <= 2
    distance = "Тепло"
  else
    distance = "Холодно"
  end
  #Использовал для вывода distance + меньше/больше, чтобы избежать двойной вложенности в if сверху
  if guessednumber > usernumber
    puts "#{distance}(нужно больше)"
  else
    puts "#{distance}(нужно меньше)"
  end
end
puts "Загаданное число: #{guessednumber}"
