output_count = ARGV[0]

if output_count.nil?
  print "Введите количество выводов:"
  output_count = $stdin.gets
end

output_count = output_count.to_i
output_count = 10 if output_count == 0

output_count.times { puts Time.now }