cars = ["Toyota", "BMW", "Mercedes", "Lada", "Subaru",
        "Jeep", "Mazda", "Tesla", "Alfa Romeo", "Ferrari"]
puts "У нас всего #{cars.length} машин. Вам какую?"
car_number = gets.to_i
if cars.include?(cars[car_number]) && !(car_number < 0)
  puts "Поздравляем, вы получили: #{cars[car_number]}"
else
  puts "Извините, машины с таким номером у нас нет :("
end
