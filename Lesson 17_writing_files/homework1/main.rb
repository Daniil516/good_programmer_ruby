SATURDAY = 6
SUNDAY = 0
current_day = Time.now
holiday_dates = File.readlines("#{__dir__}/holiday_dates_for_2022.txt",
                              encoding: "UTF-8", mode: "r", chomp: true)
puts "Проверка праздничных дней..."
sleep(2)
if current_day.wday == SATURDAY || current_day.wday == SUNDAY ||
  holiday_dates.include?(current_day.strftime("%d.%m"))
  puts "-Сегодня выходной"
else
  puts "-Сегодня нужно поработать"
end
