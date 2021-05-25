class Evaluator
  attr_reader :code,
              :guess

  def initialize(code)
    @code = code
    @guess = []
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
    if @guess != @code.secret_code
      puts " "
      puts "------------------------------------------"
      return "You have #{placement_counter} colors in the correct position."
    end
  end

  def correct_color
    correct_colors = 0
    increment = 0
    guess = @guess.dup
    guess.length.times do
      if @code.secret_code.include?(guess[increment])
        guess.delete(guess[increment])
        correct_colors += 1
      else
        increment += 1
      end
    end
    if @guess != @code.secret_code
      puts "You have guessed #{correct_colors} correct colors."
      puts "------------------------------------------"
    end
  end

  def correct_length
    if @guess.length < @code.secret_code.length
      puts " "
      puts "Oops! Your guess is too short. Please try again."
      puts " "
      return false
    elsif @guess.length > @code.secret_code.length
      puts " "
      puts "Oops! Your guess is too long. Please try again."
      puts " "
      return false
    else
      true
    end
  end

  def correct_guess
    if @guess == @code.secret_code
      return true
    else
      false
    end
  end
end
