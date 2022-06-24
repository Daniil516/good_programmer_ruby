# Программа, отправляющая почту с помощью гема pony
#Пароль, по крайней мере для mail, нужно использовать из вкладки
#пароль для сторонних приложений в настройках аккаунта почты mail.ru
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# Подключаем библиотеку для отправки писем pony
require "pony"
# Подключаем библиотеку для работы с консолью io/console
require "io/console"

puts "Введите вашу почту"
my_mail = $stdin.gets.chomp

# Спрашиваем пароль от почты, с которой будет отправлено письмо. Вместо обычного
# gets используем специальный метод из библиотеки 'io/console', который скрывает
# вводимые символы (чтобы не палить пароль, если вдруг кто-то смотрит).
puts "Введите пароль от почты #{my_mail}"
password = $stdin.noecho(&:gets).chomp

puts "Кому отправить письмо?"
send_to = $stdin.gets.chomp

puts "Введите тему письма:"
subject = $stdin.gets.chomp
puts "Что хотите написать?"
body = STDIN.gets.encode("UTF-8").chomp

Pony.mail(
  subject: subject, # тема письма
  body: body, # текст письма, его тело
  to: send_to, # кому отправить письмо
  from: my_mail, # от кого письмо (наш обратный адрес)

  # Ниже идут настройки Pony для почтового ящика на mail.ru. Подробнее об опциях
  # Pony для других сервисов см. документацию:
  #
  # https://github.com/benprew/pony
  via: :smtp,
  via_options: {
    address: 'smtp.mail.ru', # это хост, сервер отправки почты
    port: '465', # порт
    tls: true, # если сервер работает в режиме TLS
    user_name: my_mail, # используем наш адрес почты как логин
    password: password, # задаем введенный в консоли пароль
    authentication: :plain # "обычный" тип авторизации по паролю
  }

  # Настройки Pony для ящика на gmail.com
  #
  # via: :smtp,
  # via_options: {
  #   address: 'smtp.gmail.com',
  #   port: '587',
  #   enable_starttls_auto: true,
  #   user_name: my_mail,
  #   password: password,
  #   authentication: :plain,
  # }
  #
  # Настройки Pony для почтового ящика на yandex.ru
  #
  # via: :smtp,
  # via_options: {
  #   address: 'smtp.yandex.ru',
  #   port: '465',
  #   enable_starttls_auto: true,
  #   tls: true,
  #   user_name: my_mail,
  #   password: password,
  #   authentication: :plain,
  # }
  #
  # О том, какие настройки нужно задавать для вашего почтового ящика, если он у
  # вас не на mail.ru, не gmail.com и не на yandex.ru, смотрите в документации
  # вашего почтового провайдера про подключение почтовых клиентов по STMP.
  #
  # Или просто заведите тестовый ящик на одном из сервисо, ради такого дела :)
)

puts "Письмо отправлено!"
