class MyClass
  def initialize
    @variable = "some"
  end

  def check_variables
    if defined? variable
      puts "variable объявлена"
    else
      puts "variable не объявлена"
    end

    if defined? @variable
      puts "@variable объявлена"
    else
      puts "@variable не объявлена"
    end

  end

end
variable = "some_string"

a = MyClass.new
a.check_variables

puts defined? variable

puts defined? @variable