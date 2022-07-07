class Clothes
  attr_reader :clothes

  def initialize(clothes)
    @clothes = clothes
  end

  def self.read_files_from_directory(path_to_data)
    #reading all files to array of all clothes
    clothes_array = Dir["#{path_to_data}/*.txt"].map do |file_path|
      File.readlines("#{file_path}", mode: "r", encoding: "UTF-8", chomp: true )
    end
    #filling Clothes class with ItemOfClothing objects
    self.new(
      clothes_array.map { |item| ItemOfClothing.new(item[0], item[1], item[2]) }
    )
  end

  #we are getting array of clothes in such form: {type => array of clothes items of that type}
  def sort_clothes_by_types
    clothes_by_type = Hash.new
    @clothes.each do |item|
      clothes_by_type[item.type] = Array.new unless clothes_by_type.key?(item.type)
      clothes_by_type[item.type] << item
    end
    clothes_by_type
  end
end