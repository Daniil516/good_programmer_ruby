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
doc = REXML::Document.new File.new( "#{__dir__}/data/questions.xml", mode: "r", encoding: "UTF-8", chomp: true )
all_questions = []
doc.elements.each("questions/question") do |item|
  all_questions << Question.new( item.elements["text"].text, item.elements["answer"].text, item.elements["points"].text )
end

puts "Добро пожаловать в викторину. На каждый ответ даётся 10 секунд..."
sleep(3)
puts "Время пошло!"

#Основная логика викторины
current_quiz = Quiz.new
all_questions = all_questions.sample(5)
all_questions.each do |question|
  puts question.text
  start_time = Time.now
  puts current_quiz.check_answer($stdin.gets.chomp, question)
  if (Time.now.to_f - start_time.to_f) > 10
    puts "Время на вопрос вышло!!! Викторина окончена."
    break
  end
end

puts "Правильных ответов: #{current_quiz.correct_answers}"
puts "Вы набрали: #{current_quiz.final_points} баллов"
