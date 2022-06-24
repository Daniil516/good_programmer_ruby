def to_convert_usd(usd_rate, rub_amount, usd_amount)
  #долларовая часть портфеля в рублях(для сравнения долей)
  usd_in_rub = usd_rate * usd_amount

  #Конвертируемое значение(покупка или продажа)
  convert = (usd_in_rub - rub_amount ) / 2 / usd_rate
end

puts "Курс доллара:"
usd_rate = gets.to_f
puts "Сколько у вас рублей?"
rub_amount = gets.to_f
puts "Сколько у вас долларов?"
usd_amount = gets.to_f
convert = to_convert_usd(usd_rate, rub_amount, usd_amount)

if(convert.abs <= 0.01)
  puts "Ваш портфель сбалансирован"
elsif(convert > 0)
  puts "Вам надо продать #{convert.round(2)}$"
else
  puts "Вам надо купить #{convert.round(2).abs}$"
end
