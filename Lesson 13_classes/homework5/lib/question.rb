class Question
  def initialize(question_text, answer, points)
    @question_text = question_text.to_s
    @answer = answer.to_s
    @points = points.to_i
  end
  def question_text
    return @question_text
  end
  def answer
    return @answer
  end
  def points
    return @points
  end
end
