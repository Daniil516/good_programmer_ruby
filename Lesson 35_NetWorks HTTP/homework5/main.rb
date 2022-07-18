require_relative 'lib/film'
require_relative 'lib/film_collection'

#Получаем список фильмов в виде объектов
film_collection = FilmCollection.from_kinopoisk
ALL_DIRECTORS_RANGE = (1..film_collection.all_directors.length)
#Выводим всех режиссеров
puts "Программа \"Фильм на вечер\""
puts film_collection.all_directors_print

user_number = nil
until (ALL_DIRECTORS_RANGE).include? user_number do
  puts "Фильм какого режиссера вы хотите посмотреть? Введите номер режиссера из списка"
  user_number = $stdin.gets.to_i
end

user_director = film_collection.all_directors[user_number - 1]
#Получаем фильм режиссера.Если фильмов несколько - отбираем случайный
recommended_film = film_collection.to_recomend(user_director)

puts "И сегодня вечером рекомендую посмотреть:"
puts "#{recommended_film.director} - #{recommended_film.film_name} (#{recommended_film.year})"
