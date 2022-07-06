class Quiz
  attr_reader :final_points, :correct_answers

  def initialize
    @final_points = 0
    @correct_answers = 0
  end

  def check_answer(user_answer, question)
    true if user_answer.downcase == question.answer
  end

  def add_points(question)
    @final_points += question.points
    @correct_answers += 1
  end

end
