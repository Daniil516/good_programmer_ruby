class ItemOfClothing
  attr_reader :type, :temperature

  def initialize(name, type, temperature)
    @name = name
    @type = type
    @temperature = ItemOfClothing.to_range(temperature)
  end

  def self.to_range(string_temperature)
    range_numbers = string_temperature.gsub(/[()]/, "").split(",").map(&:to_i)
    Range.new(range_numbers[0], range_numbers[1])
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature}"
  end
end