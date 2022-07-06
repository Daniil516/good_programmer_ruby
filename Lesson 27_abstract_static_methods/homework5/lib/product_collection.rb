class ProductCollection
  PRODUCT_TYPES = {"books" => Book, "films" => Film, "albums" => Album}

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(root_path)

    products = []
    PRODUCT_TYPES.each do |product, product_class|#Пробегаемся по каждому продукту
      Dir["#{root_path}/data/#{product}/*.txt"].each { |file_path| products << product_class.from_file("#{file_path}") }
    end
    self.new(products)#Возвращаем все продукты, которые есть
  end

  def product_by_index(user_choice)
    @products[user_choice]
  end

  def sort!(params)
    case params[:by]
    when :title then @products.sort_by! { |product| product.to_s }
    when :price then @products.sort_by! { |product| product.price }
    when :amount then @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc
  end

  def to_s
    @products.map.with_index(1) {|product, index| "#{index}. #{product}" }
  end

  def to_a
    @products
  end
end
