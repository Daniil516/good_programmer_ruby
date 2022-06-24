class Test
  def initialize(questions, answers)
    @points = 0
    @questions = questions
    @answers = answers
  end

  def correct_answer?(user_input)
    check_answer(user_input)
    user_input == "а" || user_input == "б" || user_input == "в"
  end

  def check_answer(user_input)
    #При б - 0 баллов
    if user_input == "а"
      @points += 2
    elsif user_input == "в"
      @points += 1
    end
  end

  def get_question
    @questions.delete_at(0)
  end

  def over?
    @questions.empty?
  end

  def result
    if @points >= 30
      @answers[0]
    elsif @points >= 25
      @answers[1]
    elsif @points >= 19
      @answers[2]
    elsif @points >= 14
      @answers[3]
    elsif @points >= 9
      @answers[4]
    elsif @points >= 4
      @answers[5]
    else
      @answers[6]
    end
  end

end
