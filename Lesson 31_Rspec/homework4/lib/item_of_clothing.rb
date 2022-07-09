class ItemOfClothing
  attr_reader :type, :temperature

  def initialize(name, type, temperature)
    @name = name
    @type = type
    @temperature = temp_string_to_temp_range(temperature)
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature}"
  end

  private
  def temp_string_to_temp_range(string_temperature)
    range_numbers = string_temperature.gsub(/[()]/, "").split(",").map(&:to_i)
    Range.new(range_numbers[0], range_numbers[1])
  end
end
