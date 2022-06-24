program_path = File.dirname(__FILE__)

#Получаем лоб и выводим
foreheads_object = File.new(program_path + '\data\Forehead.txt', 'r:UTF-8')
foreheads = foreheads_object.readlines
puts foreheads.sample

#Получаем глаза и выводим
eyes_object = File.new(program_path + '\data\Eyes.txt', 'r:UTF-8')
eyes = eyes_object.readlines
puts eyes.sample

#Получаем нос и выводим
noses_object = File.new(program_path + '\data\Nose.txt', 'r:UTF-8')
noses = noses_object.readlines
puts noses.sample

#Получаем рот и выводим
mouths_object = File.new(program_path + '\data\Mouth.txt', 'r:UTF-8')
mouths = mouths_object.readlines
puts mouths.sample
