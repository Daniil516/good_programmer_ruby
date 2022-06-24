# 1 способ
puts File.readlines('./folder/file.txt', mode: 'r', encoding: 'UTF-8')
# 2 способ
puts File.readlines('folder/file.txt', mode: 'r', encoding: 'UTF-8')
