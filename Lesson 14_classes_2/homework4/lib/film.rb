class Film
  attr_reader :director

  def initialize(film_name, director, year)
    @film_name = film_name
    @director = director
    @year = year
  end

  def name_year
    "«#{@film_name}» (#{@year})"
  end
end
