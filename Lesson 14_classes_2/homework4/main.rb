require_relative "lib/film"
require_relative "lib/quiz"

files = Dir.glob("#{__dir__}/data/films/*.txt")

#Получаем список фильмов в виде объектов
films = files.map do |file_name|
  film_data = File.readlines(file_name, encoding: "UTF-8", chomp: true)
  Film.new(film_data[0], film_data[1], film_data[2])
end

puts "Добрый день, любитель кино!"
puts "Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?"
current_quiz = Quiz.new
films.sample(3).each do |current_film|
  puts "Кто снял #{current_film.name_year}?\n"

  #Получаем 4 режиссеров: 1 подходящего, 3 случайных(исключая дубликат)
  directors_array = [
    current_film.director,
    *films.delete_if { |film| film.director == current_film.director }
          .sample(3)
          .map { |film| film.director }
  ].shuffle

  #Выводим 4 режиссеров
  directors_array.each.with_index(1) do |director_name, index|
    puts "#{index.to_i}. #{director_name}"
  end

  #Ответ
  puts current_quiz.check_answer($stdin.gets.to_i - 1, directors_array, current_film.director)
end

puts "Вы угадали #{current_quiz.correct_answers} режиссер а(ов) из #{current_quiz.questions_amount}"
