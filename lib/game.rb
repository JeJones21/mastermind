require './lib/code'
require './lib/evaluator'

class Game
  attr_reader :code,
              :evaluator,
              :guess_counter

  def initialize
    @code = Code.new
    @evaluator = Evaluator.new(code)
    @guess_counter = 0
  end

  def menu
    puts " "
    puts "Welcome to 🧠 MASTERMIND 🧠"
    puts " "
    puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
    print "> "
    input = gets.chomp.upcase
    if input == 'P' || input == 'PLAY'
      play
    elsif input == 'I' || input == 'INSTRUCTIONS'
      instructions
    elsif input == 'Q' || input == 'QUIT'
      quit
    else
      puts " "
      puts "-----------------------------------------------------------"
      puts "🚨 We're sorry, your input is invalid. Please try again. 🚨"
      puts "-----------------------------------------------------------"
      menu
    end
  end

  def transform
    user_guess = gets.chomp.upcase
    if user_guess == 'C' || user_guess == 'CHEAT'
      @guess_counter -= 1
      cheat
    elsif user_guess == 'Q' || user_guess == 'QUIT'
      quit
    else
      @evaluator.transform_guess(user_guess)
      evaluate
    end
  end

  def cheat
    puts " "
    puts "👀 CHEATER ALERT 👀. Don't worry...your secret is safe with us!"
    print "Is this what you were looking for? -----> SECRET CODE: #{@code.secret_code.join}"
    puts " "
    puts " "
  end

  def evaluate
    return if @evaluator.correct_length == false
    puts @evaluator.placement
    puts @evaluator.correct_color
  end

  def play
    @start_timer = Time.now
    @code.generate
    puts " "
    puts "GAME ON! I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed, (g)reen, (y)ellow, and (b)lue. Use (q) at any time if you are a quitter."
    puts " "
    until @evaluator.correct_guess == true
      puts "What's your guess?!"
      print "> "
      transform
      @guess_counter += 1
    end
    @stop_timer = Time.now
    winner
  end

  def instructions
      puts " "
      puts "---------------------------------Instructions---------------------------------"
      puts "A secret code containing 4 colors will be generated, and it's your"
      puts "job to guess what it is! It will include a random order of (r)ed, (b)lue,"
      puts "(g)reen and (y)ellow, and can even contain repeated colors. Guess the correct"
      puts "colors in the correct order to win. Your guess should be 4 consecutive letters"
      puts "like this: rygb"
      puts  "Good luck!"
      puts "------------------------------------------------------------------------------"
      puts " "
      puts "Are you ready to (p)lay?"
      print "> "
      play_or_quit
  end

  def quit
    exit
  end

  def winner
    puts "WE HAVE A WINNER 🎉🎉🎉🎉🎉!! Congratulations, you guessed the secret code with #{guess_counter} guesses in #{timer}!"
    puts " "
    puts "Would you like to (p)lay again, or (q)uit?"
    print "> "
    play_or_quit
  end

  def play_or_quit
    input = gets.chomp.upcase
    if input == 'P' || input == 'PLAY'
      play
    elsif input == 'Q' || input == 'QUIT'
      quit
    end
  end

  def timer
    total_time = @stop_timer - @start_timer
    minutes = total_time / 60
    seconds = total_time % 60
    "#{minutes.to_i} minutes and #{seconds.to_i} seconds"
  end
end
