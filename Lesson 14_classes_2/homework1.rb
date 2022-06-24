def enemy(hero)
  case hero
  when "Batman"
    "Joker"
  when "Sherlock Holmes"
    "Moriarty"
  when "Mario"
    "Bowser"
  when "Frodo baggins"
    "Sauron"
  else
    "Programm doesn't know such hero"
  end
end
puts "Врага какого персонажа вы хотите узнать?"
puts enemy($stdin.gets.chomp)
