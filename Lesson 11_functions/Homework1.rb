def circle_square(circle_radius)
  return 3.14 * (circle_radius ** 2)
end

puts "Введите радиус круга:"
circle_radius = gets.to_f
puts "Площадь круга: #{circle_square(circle_radius)}"

puts "Введите радиус второго круга:"
circle_radius = gets.to_f
puts "Площадь второго круга: #{circle_square(circle_radius)}"
