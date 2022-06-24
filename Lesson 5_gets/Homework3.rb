puts "Какая у вас на руках валюта
1. Рубли
2. Доллары"
currency_choice = gets.to_i
puts "Сколько сейчас стоит доллар?"
usd_rate = gets.to_f
puts "Сколько у вас валюты на руках?"
amount = gets.to_f
if(currency == 1)
  puts "Ваши запасы равны: $ #{amount / usd_rate}"
else
  puts "Ваши запасы равны: P #{amount * usd_rate}"
end
