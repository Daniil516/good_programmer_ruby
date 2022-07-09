# encoding: utf-8
# метод для склонения русских слов в соответствии с числительным, преобразовано к классу
# взято из 9 урока курса НПДВ-1
require "rspec"

class Sklonjator

  # Статический метод будет возвращать правильно склонение слова,
  # когда нужно его использовать с числом
  # Например во фразах, типа "1 крокодил, 23 крокодила, 7 крокодилов"
  def self.sklonenie(number, krokodil, krokodila, krokodilov)
    # проверим входные данные на правильность
    if (number == nil || !number.is_a?(Numeric))
      number = 0 # если первый параметр пустой или не число, то продолжаем как будто он нулевой
    end

    ostatok = number % 10 # склонение определяется последней цифрой в числе

    if (ostatok == 1) # для 1 - именительный падеж (Кто? Что?)
      return krokodil
    end

    if (ostatok >= 2 && ostatok <= 4) # для 2-4 - родительный падеж (Кого? Чего?)
      return krokodila
    end

    # 5-9 или ноль – родительный падеж и множественное число
    if (ostatok >= 5 && ostatok <= 9 || ostatok == 0)
      return krokodilov
    end
  end

end