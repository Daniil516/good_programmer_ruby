class Film

  attr_reader :film_name, :film_director, :year

  def initialize(film_name, film_director, year)
    @film_name = film_name
    @film_director = film_director
    @year = year
  end

end
