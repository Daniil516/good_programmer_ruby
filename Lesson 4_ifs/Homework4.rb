edge = rand(10)
coin = rand(2)
if(edge == 0)#Вероятность ребра - 1/10
  puts "Встала на ребро"
  elsif coin == 0#Если не ребро, то либо орел, либо решка 1 к 2
    puts "Выпал орел"
  else
    puts "Выпала решка"
  end
