require_relative 'lib/film'
require_relative 'lib/films'

#Получаем список фильмов в виде объектов
films = Films.get_from_link("#{__dir__}/data/the_best_films.html")
ALL_DIRECTORS_RANGE = (1..films.all_directors.length)
#Выводим всех режиссеров
puts "Программа \"Фильм на вечер\""
puts films.all_directors_print

user_number = nil
until (ALL_DIRECTORS_RANGE).include? user_number do
  puts "Фильм какого режиссера вы хотите посмотреть? Введите номер режиссера из списка"
  user_number = $stdin.gets.to_i
end

user_director = films.all_directors[user_number - 1]
#Получаем фильм режиссера.Если фильмов несколько - отбираем случайный
recommended_film = films.to_recomend(user_director)

puts "И сегодня вечером рекомендую посмотреть:"
puts "#{recommended_film.director} - #{recommended_film.film_name} (#{recommended_film.year})"
