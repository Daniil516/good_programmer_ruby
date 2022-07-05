class Quiz
  attr_reader :final_points, :correct_answers
  def initialize
    @final_points = 0
    @correct_answers = 0
  end

  def check_answer(user_answer, question)
    if user_answer.downcase == question.answer
      @correct_answers += 1
      @final_points += question.points
      "Молодец"
    else
      "Неправильно. Ответ - #{question.answer}"
    end
  end

end
