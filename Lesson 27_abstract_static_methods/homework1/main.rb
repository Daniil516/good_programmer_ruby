require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"

products = []
# types: 0 - book, 1 - film
products << Product.create(0, {name: "Count of Monte Cristo", genre: "novel",
                                             author: "Duma", price: 14, amount_on_warehouse: 7})

products << Product.create(1, {name: "Space odyssey", director: "Cubrick",
                                             price: 20, amount_on_warehouse:3, year: 1964})
puts products[0].to_s
puts products[1].to_s