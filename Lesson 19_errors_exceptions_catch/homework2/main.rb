puts "Первое число:"
first_num = $stdin.gets.to_f
puts "Второе число:"
second_num = $stdin.gets.to_f
puts "Выберите операцию (+ - * /):"
operator = $stdin.gets.chomp
case operator
when "+"
  puts first_num + second_num
when "-"
  puts first_num - second_num
when "*"
  puts first_num * second_num
when "/"
    puts first_num / second_num
end