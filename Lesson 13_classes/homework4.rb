class Chameleon
  def initialize(color)
    @color = color
  end
  def color
    return @color
  end
  def color=(color)
    @color = color
  end
end

chameleon1 = Chameleon.new("green")
puts chameleon1.color
sleep(1)
chameleon1.color = "red"
puts chameleon1.color
