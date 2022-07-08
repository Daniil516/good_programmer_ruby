class ClothesCollection
  attr_reader :clothes_by_types

  def initialize(clothes_by_types)
    @clothes_by_types = clothes_by_types
  end

  def self.get_clothes_by_types(path_to_data)
    #reading all files to array of clothes
    array_of_clothes = ClothesCollection.read_files_from_directory(path_to_data)
    #reading array of clothes to array of items(objects) of clothes
    clothes_objects = ClothesCollection.get_clothes_objects_from_array(array_of_clothes)
    #getting hash of clothes in such form: {type => array of items of that clothes type}
    self.new(ClothesCollection.sort_clothes_by_types(clothes_objects)).clothes_by_types
  end

  def self.read_files_from_directory(path_to_data)
    clothes_array = Dir["#{path_to_data}/*.txt"].map do |file_path|
      File.readlines("#{file_path}", mode: "r", encoding: "UTF-8", chomp: true )
    end
  end

  def self.get_clothes_objects_from_array(clothes_in_array)
    clothes_in_array.map { |item| ItemOfClothing.new(item[0], item[1], item[2]) }
  end

  def self.sort_clothes_by_types(clothes_objects)
    clothes_by_type = {}
    clothes_objects.each do |item|
      clothes_by_type[item.type] = [] unless clothes_by_type.key?(item.type)
      clothes_by_type[item.type] << item
    end
    clothes_by_type
  end
end