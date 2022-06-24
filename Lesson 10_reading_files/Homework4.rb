if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Извлекаем все названия файлов
current_path =
origin_questions = Dir.entries(current_path + '/data_Homework4')
origin_questions.delete_at(0)
origin_questions.delete_at(0)

#Перезаписываем как двумерный массив. Ячейка это файл. В ней вопрос под индексом [0] и ответ[1]
origin_questions = origin_questions.map do
  File.readlines(File.dirname(__FILE__), chomp: true)
  #File.new( + "#{file}", 'r:UTF-8').readlines.to_a
end
correct_count = 0
#Дабы не удалять вопросы создам второй массив из которого буду брать данные и удалять использованные вопросы
origin_questions.sample(3).each do |question|
  puts question[0]
  user_input = gets.chomp.downcase
  if(user_input == question[1].chomp.downcase)
    puts "Правильно!)"
    correct_count += 1
  else
    puts "Вы ошиблись. Ответ: #{question[1]}"
  end
end

puts "Правильных ответов: #{correct_count} из 3"
