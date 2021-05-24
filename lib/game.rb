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
end
