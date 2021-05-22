class Evaluator
  attr_reader :code,
              :guess

  def initialize(code)
    @code = code
  end

  def transform_guess(user_guess)
    @guess = user_guess.upcase.split(//)
  end
end
