require_relative 'lib/question.rb'
require_relative 'lib/quiz.rb'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Получаем все имена файлов с вопросами
files = Dir.glob('data/*.txt')

#Считываем все файлы и приводим к массиву объектов типа Question
all_questions = files.map do |question_file_name|
  question_file = File.new("#{question_file_name}", "r:UTF-8")
  file_in_array = question_file.readlines(chomp: true)
  question_file.close
   Question.new(file_in_array[0], file_in_array[1], file_in_array[2])
end

current_quiz = Quiz.new

all_questions.sample(5).each do |question|
  puts question.question_text
  puts current_quiz.check_answer($stdin.gets.chomp, question)
end

puts "Правильных ответов: #{current_quiz.correct_answers}"
puts "Вы набрали: #{current_quiz.final_points} баллов"
