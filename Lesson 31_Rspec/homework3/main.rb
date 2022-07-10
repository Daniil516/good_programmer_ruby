require_relative 'lib/film'

#Получаем список фильмов в виде объектов
films = Dir.glob("#{__dir__}/data/films/*.txt").map do |file_name|
  film_data = IO.readlines("#{file_name}", encoding: "UTF-8", chomp: true)
  Film.new(film_data[0], film_data[1], film_data[2])
end

#Выводим всех режиссеров
puts "Программа \"Фильм на вечер\""
all_directors = films.map(&:director).uniq.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

user_number = nil
until (1..all_directors.length).include? user_number do
  puts "Фильм какого режиссера вы хотите посмотреть? Введите номер режиссера из списка"
  user_number = $stdin.gets.to_i
end

#Получаем фильм режиссера.
user_director = all_directors[user_number - 1]
# Если фильмов несколько - отбираем случайный
to_recomend = films.select { |film| film.director == user_director }.sample

puts "И сегодня вечером рекомендую посмотреть:"
puts "#{user_director} - #{to_recomend.film_name} (#{to_recomend.year})"
