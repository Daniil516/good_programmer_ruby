
puts "Курс доллара:"
usd_rate = gets.to_f

puts "Сколько у вас рублей?"
rub_amount = gets.to_f

puts "Сколько у вас долларов?"
usd_amount = gets.to_f

#долларовая часть портфеля в рублях(для сравнения долей)
usd_in_rub = usd_rate * usd_amount

#если долларов > чем 50%
if(usd_in_rub > rub_amount)
  to_sell = ((usd_in_rub - rub_amount) / 2) / usd_rate

#Если нужно продать НЕ меньше одного цента - продаем, в ином случае необходимости нет
  if !(to_sell < 0.01)
    puts "Вам надо продать #{to_sell.round(2)}$"
  else
    puts "Ваш портфель сбалансирован"
    abort
  end

  #если долларов < чем 50%
elsif (usd_in_rub < rub_amount)
  to_buy = ((rub_amount - usd_in_rub) / 2) / usd_rate

#Если нужно купить НЕ меньше одного цента - покупаем, в ином случае необходимости нет
  if !(to_buy < 0.01)
    puts "Вам надо купить #{to_buy.round(2)}$"
  else
    puts "Ваш портфель сбалансирован"
    abort
  end

end
