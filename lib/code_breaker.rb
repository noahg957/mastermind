#ruby code_breaker.rb
require "require_all"
require_rel "code_colors"
require "colorize"
require "pp"
require "pry"

class CodeBreaker
  include CodeColors
  def guess
    puts "What is your guess?"
    @guess = gets.chomp.split("")
    if @guess.length != 4
      return "error"
    end
    @guess.each { |color| 
      if COLORS.include?(color) == false
        return "error"
      end }
    puts "You guessed:" 
    print colorize_code(@guess)
    @guess
  end
end

