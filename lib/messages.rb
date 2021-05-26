class Messages

def initialize
end

def display_menu
  puts " "
  puts "Welcome to 🧠 MASTERMIND 🧠"
  puts " "
  puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
  print "> "
 end

 def instruct
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
  end
end
