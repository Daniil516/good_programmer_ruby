require "rexml/document"
require "date"
require_relative "lib/question"
require_relative "lib/quiz"

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Парсим xml doc с вопросами в массив объектов Question
file = File.new("#{__dir__}/data/questions.xml", mode: "r", encoding: "UTF-8", chomp: true)
doc = REXML::Document.new(file)

all_questions = doc.get_elements("questions/question").map do |item|
  Question.new(item.elements["text"].text, item.elements["answer"].text, item.elements["points"].text)
end

puts "Добро пожаловать в викторину. На каждый ответ даётся 10 секунд..."
sleep(3)
puts "Время пошло!"

#Основная логика викторины
current_quiz = Quiz.new
current_questions = all_questions.sample(5)
current_questions.each do |question|
  puts question.text
  start_time = Time.now
  if current_quiz.check_answer($stdin.gets.chomp, question)
    puts "Молодец"
    current_quiz.add_points(question)
  else
    "Неправильно. Ответ - #{question.answer}"
  end
  if (Time.now.to_f - start_time.to_f) > 10
    puts "Время на вопрос вышло!!! Викторина окончена."
    break
  end
end

puts "Правильных ответов: #{current_quiz.correct_answers}"
puts "Вы набрали: #{current_quiz.final_points} баллов"
