require_relative "lib/question"
require_relative "lib/quiz"

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Получаем все имена файлов с вопросами
absolute_path = File.dirname(__FILE__)
files = Dir.glob("#{absolute_path}/data/*.txt")

#Считываем все файлы и приводим к массиву объектов типа Question
all_questions = files.map do |question_path|
  file_in_array = IO.readlines(question_path, encoding: "UTF-8", chomp: true)
  Question.new(file_in_array[0], file_in_array[1], file_in_array[2])
end

#Основная логика викторины
current_quiz = Quiz.new
all_questions = all_questions.sample(5)
all_questions.each do |question|
  puts question.text
  puts current_quiz.check_answer($stdin.gets.chomp, question)
end

puts "Правильных ответов: #{current_quiz.correct_answers}"
puts "Вы набрали: #{current_quiz.final_points} баллов"

