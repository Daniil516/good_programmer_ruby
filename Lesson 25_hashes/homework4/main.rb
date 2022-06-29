def happy_birthday(person)
  <<-MESSAGE
  Dear #{person[:name]},

  Happy birthday to you!
  You are turning #{person[:age]} years old!

  #{person[:congrats]}
  MESSAGE
end

person = {
  name: "Philip",
  age: 18,
  congrats: "I wish, your every day become happy,
             \r  joyful and full of laughter"
}

puts happy_birthday(person)
