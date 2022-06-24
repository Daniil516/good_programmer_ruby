# Подключаем библиотеку для работы с классом Date
require 'date'
#Для address создаём отдельный класс и помещаем его, как поле в Patient
class Address
  def initialize(street, home, city)
    @street = street
    @home = home
    @city = city
  end
  def street
    return @street
  end
  def home
    return @home
  end
  def city
    return @city
  end
end

# Наш класс Пациент
class Patient
  # Конструктор — принимает на вход все данные и "раскладывает" их по полочкам:
  # соответствующим переменным экземпляра с @.
  def initialize(name, patronymic_name, family_name, date_of_birth, address)
    @name = name
    @patronymic_name = patronymic_name
    @family_name = family_name
    @date_of_birth = Date.parse(date_of_birth)
    @address = address
  end

  def adress
    return "#{@address.city} #{@address.street} #{@address.home}"
  end
  # Метод name — геттер, который возвращает содержимое переменной экземпляра
  def name
    return @name
  end

  # Метод full_name — вычисляемое значение, возвращает строку, содержащую
  # фамилию и инициалы
  #
  # Венедиктов В.А.
  def full_name
    return "#{@family_name} #{@name[0]}.#{@patronymic_name[0]}."
  end

  # Метод age — возвращает количество полных лет пациента
  def age
    today = Date.today
    result = today.year - @date_of_birth.year - 1

    if (today.month > @date_of_birth.month) ||
      (today.month == @date_of_birth.month &&
       today.day >= @date_of_birth.day)
      result += 1
    end

    return result
  end

  # Методы adult? — возвращает true, если пациент совершеннолетний или
  # false, если нет
  def adult?
    return age >= 18
  end
end

# ---
daniil = Patient.new("Daniil", "Grigorevich",
  "Grishchenko", "05.06.2003", Address.new("golubinskaya 17/9", "490", "Moscow"))

# Выводим всю информацию о пациенте, вызывая соответствующие методы у экземпляра
# класса Patient
puts "Пациент 1:"
puts daniil.full_name
puts "Возраст: #{daniil.age}"
puts "Совершеннолетний: #{daniil.adult?}"
puts daniil.adress
