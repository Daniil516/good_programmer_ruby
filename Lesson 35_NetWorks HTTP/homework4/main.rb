require_relative "lib/currency_cbr"
require_relative "lib/dual_currency_portfolio"

currency = CurrencyCBR.new
puts "Here are available currency to diversify with ruble."

currency.available_currencies.keys.each.with_index(1) do |currency_name, index|
  puts "#{index}: #{currency_name}"
end

required_currency = nil
loop do
  print "Enter required currency from list(\"ABC\"): "
  required_currency = $stdin.gets.chomp.upcase.to_sym
  break if currency.available_currencies.keys.include?(required_currency)
end

puts "How many #{required_currency} do you have?"
currency_amount = $stdin.gets.to_i
puts "How many rubles do you have?"
rub_amount = $stdin.gets.to_i

portfolio = DualCurrencyPortfolio.new(
                                {
                                        currency_amount: currency_amount,
                                        rub_amount: rub_amount,
                                        currency_rate: currency.one_currency_rate(required_currency)
                                       }
                                     )
puts portfolio.what_to_do?