if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

def gets_data()
  puts "Введите фамилию: "
  user_surname = gets.chomp
  puts "Введите имя: "
  user_name = gets.chomp
  puts "Введите отчество: "
  middle_name = gets.chomp
  return [user_surname, user_name, middle_name]
end

def get_initials(user_data)
  return "#{user_data[0]} #{user_data[1].chars.first}.#{user_data[2].chars.first}."
end

user_data = gets_data()
puts get_initials(user_data)



