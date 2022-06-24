puts "Первое число:"
first_num = $stdin.gets.to_i
puts "Второе число:"
second_num = $stdin.gets.to_i
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
  begin
    puts first_num / second_num
  rescue ZeroDivisionError => error
    puts "Нельзя делить на ноль!!! (#{error.message})"
  end
end