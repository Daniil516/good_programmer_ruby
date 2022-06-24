temperature = ARGV[0]
season = ARGV[1]
#GettingLostArgs
if temperature.nil?
  puts "Какая сейчас температура?"
  temperature = STDIN.gets.to_i
end
if season.nil?
  puts "Какое время года?"
  season = STDIN.gets.to_i
end
#GettingConditions
condition1 = (22..30).include?(temperature)
condition2 = season == 1 && (15..35).include?(temperature)
#Check
if condition1 || condition2
  puts "Скорее идите в парк, соловьи поют!"
else
  puts "Сейчас соловьи молчат, греются или прохлаждаются :)"
end
