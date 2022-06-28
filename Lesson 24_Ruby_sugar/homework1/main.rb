output_count = ARGV[0]

if output_count.nil?
  print "Введите количество выводов:"
  output_count = $stdin.gets
end
#Пришлось выделить отдельную строку, так как иначе пришлось бы в двух местах писать .to_i на стр: 9, 11
output_count = output_count.to_i
output_count = 10 if output_count == 0

output_count.times { puts Time.now }