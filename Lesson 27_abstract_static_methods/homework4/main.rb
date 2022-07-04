require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/product_collection"

products = ProductCollection.from_dir


puts products.to_a
