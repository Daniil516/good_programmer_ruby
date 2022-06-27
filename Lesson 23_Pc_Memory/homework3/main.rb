def method
  c = 3
  puts "Переменная \"$a\":#{defined? $a}"
  puts "Переменная \"b\":#{defined? b}"
  puts "Переменная \"c\":#{defined? c}"
end
$a = 1
b = 2
puts "Переменная \"$a\":#{defined? $a}"
puts "Переменная \"b\":#{defined? b}"
puts "Переменная \"c\":#{defined? c}"
method
