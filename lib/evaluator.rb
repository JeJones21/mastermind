class Evaluator
  attr_reader :code,
              :guess

  def initialize(code)
    @code = code
  end

  def transform_guess(user_guess)
    @guess = user_guess.upcase.split(//)
  end

  def placement
    placement_counter = 0
    @guess.length.times do |i|
      if @guess[i] == @code.secret_code[i]
        placement_counter += 1
      end
    end
    return placement_counter
  end

  def correct_color
    correct_colors = 0
    increment = 0
    @guess.length.times do
      if @code.secret_code.include?(@guess[increment])
        @guess.delete(@guess[increment])
        correct_colors += 1
      else
        increment += 1
      end
    end
    return correct_colors
  end
end
