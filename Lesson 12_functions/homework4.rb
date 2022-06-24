def get_bmi(weight, height)
  (weight / height**2).round(2)
end
def get_verdict(bmi)
  case bmi
  when (0..16)
    "Выраженный дефицит массы тела"
  when (16..18.5)
    "Недостаточная (дефицит) масса тела"
  when (18.5..25)
    "Норма"
  when (25..30)
    "Избыточная масса тела (предожирение)"
  when (30..35)
    "Ожирение 1 степени"
  when (35..40)
    "Ожирение 2 степени"
  else
    "Ожирение 3 степени"
  end
end

puts "Введите ваш вес (в кг.):"
weight = gets.to_f
puts "Введите ваш рост (в м.):"
height = gets.to_f

bmi = get_bmi(weight, height)
puts "Ваш индекс: #{bmi}"
puts "#{get_verdict(bmi)}"

