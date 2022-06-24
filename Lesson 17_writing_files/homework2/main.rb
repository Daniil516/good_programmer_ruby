#Получаем целое лицо
face = %w[Forehead Eyes Nose Mouth].map do |face_part|
  File.readlines("#{__dir__}/data/#{face_part}.txt", mode: "r", encoding: "UTF-8").sample
end

#Записываем лицо в файл
current_time = Time.now.strftime("%d.%m.%Y_%H-%M-%S")
face.each do |face_part|
  File.write("#{__dir__}/faces/face #{current_time}.txt", face_part,  mode: "a", encoding: "UTF-8")
end

puts "Это лицо записано в файл:"
puts face
