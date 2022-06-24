if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

shopping_list = ["масло", "молоко", "хлопья", "картошка", "курица", "помидоры"]
bought_list = []
puts "Нужно купить: \n #{shopping_list}"
while !(shopping_list.empty?)
  if (bought_list.empty? )
    puts "Вы ничего ещё не купили"
  else
    puts "Нужно купить \n #{shopping_list.to_s}"
    puts "Вы купили: \n #{bought_list.to_s}"
  end
  puts "Что хотите купить?"
  item = gets.chomp
  if shopping_list.include? item
    shopping_list.delete(item.chomp)
    bought_list << item
  else
    puts "Вы купили всё"
  end
end
