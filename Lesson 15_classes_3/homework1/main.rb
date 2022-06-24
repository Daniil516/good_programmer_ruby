require_relative 'lib/test'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

name = ARGV[0]

if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end

version = "Тест \"Ваш уровень общительности\". Версия 1.0. (c) Grishchenko Daniil\n\n"

if name.nil?
  name = "Некто"
elsif name == "-v"
  puts version
  exit
end

questions = File.new(__dir__ + '/data/all_questions.txt', 'r:UTF-8').readlines(chomp: true)
answers = File.new(__dir__ + '/data/all_answers.txt', 'r:UTF-8').readlines(chomp: true)

current_test = Test.new(questions, answers)
puts "Приветствую #{name}. Предлагаю пройти тебе \"Тест на общительность\". Удачи :) "
until current_test.over? do

  puts current_test.get_question

  begin
    puts "Введите букву: \n а) да; \n б) нет; \n в) иногда."
  end until current_test.correct_answer?($stdin.gets.chomp)

end

puts current_test.result
