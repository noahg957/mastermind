# ruby game.rb
require "colorize"
require "require_all"
require_rel "code_breaker"
require_rel "code_colors"
require_rel "code_setter"
require "colorize"

class Game
  include CodeColors
  def initialize
    @win = false
    @again = "no"
    puts "\nYou have 12 tries to guess the computer's code."
    puts "\nAfter each guess, you will receive feedback on your guess."
    puts "\nIf you guess the correct color in the correct place, then you will receive this icon:"
    puts TOKENS["place_color"]
    puts "If you guess the correct color in the wrong place, then you will receive this icon:"
    puts TOKENS["just_color"]
    puts "The color options are:"
    puts colorize_code(COLORS)
    puts "The computer is generating a code..."
    puts ""
    sleep 1
  end
  def start_game
    setter = CodeSetter.new
    breaker = CodeBreaker.new
    setter.set_code
    i = 12
    while i > 0
      puts "You have #{i} guesses left. Guess wisely!"
      guess = breaker.guess
      result = setter.check_code(guess)
      if result == "error"
        puts "Error! Please enter a valid four color code.".colorize(:red)
        next
      elsif result == "win"
        @win = true
        puts ""
        puts "Congratulations, you win!"
        puts "The code was:"
        puts colorize_code(setter.code)
        break
      else
        i -= 1
        setter.feedback
      end
    end
    unless @win == true 
      puts "Guess you lost... The code was:"
      puts colorize_code(setter.code)
    end
    puts "Do you want to play again?"
    if gets.chomp == "yes"
      @again = 'yes'
    end
  end
  def game_loop
    start_game
    while @again == "yes"
      start_game
    end
  end
end


    