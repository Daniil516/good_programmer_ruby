if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Привет, я твой дневник. Скажи мне, что у тебя на уме и в душе?"
puts "Я сохраню всё, что ты напишешь до строчки \"end\" в файл."

all_lines = []
line = ""
while line != "end" do
  line = STDIN.gets.chomp
  all_lines << line
end

time = Time.now

file_name = time.strftime("%Y-%m-%d") #year-month-day

time_string = time.strftime("%H:%M") #hours:minutes

separator = "-------------------------------------"

file = File.new("#{__dir__}/#{file_name}.txt", "a:UTF-8")

file.print("\n\r" + time_string + "\n\r")

all_lines.pop#Убираем end поставленный юзером, чтобы завершить запись
file.puts(all_lines)
#for item in all_lines do
#  file.puts(item)
#end

file.puts(separator)
file.close

puts "Запись успешно сохранена в файл: #{file_name}.txt"
