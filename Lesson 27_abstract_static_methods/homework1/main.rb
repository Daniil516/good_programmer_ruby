require_relative "lib/film"

buying_film = Film.new(price: 290, amount_on_warehouse: 7)

puts "The movie Leon price is #{buying_film.price} rub."