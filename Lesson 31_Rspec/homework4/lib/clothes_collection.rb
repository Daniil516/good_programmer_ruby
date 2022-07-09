class ClothesCollection
  attr_reader :clothes
  def initialize(clothes)
    @clothes = clothes
  end

  def self.from_dir(path_to_data)#reading all files to array of clothes
    clothes_array = Dir["#{path_to_data}/*.txt"].map do |file_path|
      File.readlines("#{file_path}", mode: "r", encoding: "UTF-8", chomp: true )
    end
    #reading array of clothes to array of items(objects) of clothes
    self.new(
      clothes_array.map { |item| ItemOfClothing.new(item[0], item[1], item[2]) }
    )
  end

  def for_weather(user_temperature)
    sorted_clothes = sort_clothes_by_types(@clothes)

    clothes_by_weather = []
    sorted_clothes.each_key do |type|#puts one item from each type if it is in required temperature
      item = sorted_clothes[type].detect {|item| item.temperature.include?(user_temperature) }
      clothes_by_weather << item unless item.nil?
    end
    clothes_by_weather
  end

  private
  #getting hash of clothes in such form: {type => array of items of that clothes type}
  def sort_clothes_by_types(clothes)
    clothes_by_type = {}
    clothes.each do |item|
      clothes_by_type[item.type] = [] unless clothes_by_type.key?(item.type)
      clothes_by_type[item.type] << item
    end
    clothes_by_type
  end
end