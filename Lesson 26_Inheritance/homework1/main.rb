class Parent
  attr_reader :name, :patience

  def initialize(name)
    @name = name
    @patience = true
  end
end

class Child < Parent
  def initialize(name)
    super
    @patience = false
  end
end

boris = Parent.new("Boris Ivanovich")
puts "#{boris.name}, patience: #{boris.patience}"

ivan = Child.new("Ivan Borisovich")
puts "#{ivan.name}, patience: #{ivan.patience}"