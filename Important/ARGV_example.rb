#Передавай в CMD аргумент: ruby ARGV_example.rb(название файла) "добрый режим"(аргумент)
#ARGV[0] указывает, что мы берем лишь один, аргумент ARGV. Если хотим принять массив используем variable = ARGV
argument = ARGV[0]
if(argument == "добрый_режим")
  puts "Рады вас видеть. Как ваши дела?)"
elsif argument == "злой_режим"
  puts "Здорово паршивец. Чё надо?"
else
  puts "Привет."
end

