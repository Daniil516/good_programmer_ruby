class ProductCollection
  def initialize(products = [])
    @products = products
  end

  def self.from_dir(root_path)
    products = []
    Product.get_types.each do |product, product_class|#Пробегаемся по каждому продукту
      Dir["#{root_path}/data/#{product}/*.txt"].each { |file_path| products << product_class.from_file("#{file_path}") }
    end
    self.new(products)#Возвращаем все продукты, которые есть
  end

  def sort(by)
    if Product.method_defined? by
      @products.sort_by!{ |element| element.send(by) }#converting string to method_name
    else
      warn "Product can't sort by chosen parameter. Default products list is returned"
      @products
    end
  end

  def to_a
    @products
  end
end
