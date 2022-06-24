class Test
  CONSTANT = 5
  def initialize

  end
  def use_constant
    #Внутри класса
    CONSTANT
  end
end
#вывод вне класса
puts Test::CONSTANT
