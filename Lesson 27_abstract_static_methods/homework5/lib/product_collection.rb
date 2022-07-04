class ProductCollection
  def initialize(products = [])
    @products = products
  end

  def self.from_dir
    all_product_paths = Dir.glob("data/**/*.txt")
    products = []
         all_product_paths.each do |product_path|
           products << if product_path.include?("books")
                         Book.from_file(product_path)
                       elsif product_path.include?("films")
                         Film.from_file(product_path)
                       elsif product_path.include?("albums")
                         Album.from_file(product_path)
                       end
         end
    self.new(products)
  end

  def sort(by)
    @products.sort_by!{ |element| element.send(by)}#converting string to method_name
  end

  def to_a
    @products
  end
end
