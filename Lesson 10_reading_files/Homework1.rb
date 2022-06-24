#принимаем имя файла в аргументах при запуске
filename = ARGV[0]
#Получаем путь программы независимо от того, откуда мы запускаем её
current_path_of_program_rb = File.dirname(__FILE__)

#Если пользователь не указываем аргумент
if filename == nil
  abort "Укажите имя файла в качестве аргумента программы"
end

#Получаем путь файла
path_of_file = current_path_of_program_rb + "/data/" + filename
#Проверяем существует ли файл
unless File.exist?(path_of_file)
  abort "Файл не найден!"
end
#Складываем путь программы с путем файла


filedata = []
  #создаем объект файла
  file_object = File.new(path_of_file, "r:UTF-8")

  #Считываем все строки файла
  filedata = file_object.readlines
  puts "Вы открыли файл: #{filename}"

  #обязательно закрываем объект доступа к файлу, ради ресурсов и безопасности
  file_object.close

puts "Всего строк: #{filedata.length}"

#Считываем все пустые строки. Не забываем, что считанные строки идут с \n
blanklines = 0
for line in filedata do
  blanklines += line.chomp == "" ? 1 : 0
end

puts "Пустых строк: #{blanklines}"

puts "Последние 5 строк файла: #{filedata.last(5)}"
