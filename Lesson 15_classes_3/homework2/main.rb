require_relative 'lib/film'

#Получаем список фильмов в виде объектов
films = Dir.glob(__dir__ + '/data/films/*.txt').map do |file_name|
  film_data = File.new("#{file_name}", "r:UTF-8").readlines(chomp: true)
  Film.new(film_data[0], film_data[1], film_data[2])
end

#Выводим всех режиссеров
puts "Программа \"Фильм на вечер\""
all_directors = films.map {|film| film.director}.uniq.each_with_index do |director, index|
  puts "#{index + 1}: #{director}"
end

user_number = -1
begin
  puts "Фильм какого режиссера вы хотите посмотреть? Введите номер режиссера из списка"
  user_number = $stdin.gets.to_i
end until (1..all_directors.length).include? user_number

#Получаем фильм режиссера.
user_director = films[user_number - 1].director
# Если фильмов несколько - отбираем случайный
to_recomend = films.select {|film| film.director == user_director}.sample

puts "И сегодня вечером рекомендую посмотреть:"
puts "#{user_director} - #{to_recomend.film_name} (#{to_recomend.year})"
