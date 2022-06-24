symbols = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
token = ""
8.times do token += symbols.sample end
puts token
