#кодировка
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
#берем все названия файлов папки data и удаляем лишний мусор
files = Dir.entries('.\data')
files.delete_at(0)
files.delete_at(0)
#Выводим содержимое папки с индексами
puts "Какой файл вам показать? (введите номер)"
i = 0
for file in files do
  puts "#{i.to_s}: " + file
  i += 1
end
#Выводим содержимое выбранного файла
user_input = gets
if ( (0..files.length - 1).include?(user_input.to_i))
  puts "Привет! Я содержимое файла #{ files[user_input.to_i] }!"
  file_content = File.new('./data/' + files[user_input.to_i])
  puts file_content.readlines
else
  puts "Такого файла нет"
end

