class Game
  attr_reader :code,
              :evaluator

  def initialize
    @code = Code.new
    @evaluator = Evaluator.new(code)
  end

  def menu
    puts " "
    puts "Welcome to MASTERMIND"
    puts " "
    puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
    print "> "
    input = gets.chomp.downcase
    if input == 'p' || input == 'play'
      start_game
    elsif input == 'i' || input == 'instructions'
      instructions
    elsif input == 'q' || input == 'quit'
      quit_game
    end
  end

  def start
    menu
  end

  def transform
    user_guess = gets.chomp.upcase
    if user_guess == 'C' || user_guess == 'CHEAT'
      print @code.secret_code
      puts " "
    else
      @evaluator.transform_guess(user_guess)
    end
  end

  def evaluate
    return if @evaluator.correct_length == false
    puts @evaluator.placement
    puts @evaluator.correct_color
  end
end
