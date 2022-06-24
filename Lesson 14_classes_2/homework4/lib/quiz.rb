class Quiz
  attr_reader :questions_amount, :correct_answers

  def initialize
    @questions_amount = 0
    @correct_answers = 0
  end

  def check_answer(user_input, directors_array, current_film_director)
    @questions_amount += 1
    user_director = user_input >= 0 ? directors_array[user_input] : nil
    if user_director == current_film_director
      @correct_answers += 1
      "Верно!"
    else
      "Неправильно! Правильный ответ — #{current_film_director}."
    end
  end
end
