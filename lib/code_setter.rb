#ruby code_setter.rb
require "require_all"
require_rel "code_colors"
require "colorize"
require "pry"

class Array
  def delete_elements_in(array)
    array.each do |x|
      if index = index(x)
        delete_at(index)
      end
    end
  end
end

class CodeSetter
  include CodeColors
  def initialize
    @code = Array.new
    @feedback = []
  end
  attr_reader :code
  def set_code
    4.times do
      @code.push(COLORS.sample)
    end
    @code
  end

  def check_code(guess)
    if guess == "error"
      return "error"
    elsif guess == @code
      return "win"
    else
      guess_clone = Array.new(guess)
      code_clone = Array.new(@code)
      red_reductions = []
      
      guess.each_with_index do |color, index|
        if color == @code[index]
          red_reductions.push(color)
          @feedback.push(TOKENS["place_color"])
          
        end
        
      end
      guess_clone.delete_elements_in(red_reductions)
      code_clone.delete_elements_in(red_reductions)
      
      guess_clone_reduced = Array.new(guess_clone)
      guess_clone.each_with_index do |color, index|
          if code_clone.include?(color) == false && guess_clone_reduced.include?(color) == true
            
            guess_clone_reduced.delete(color)
            
          end
        end
        
      end
      
      length_initial = code_clone.length
      code_clone.delete_elements_in(guess_clone_reduced)
      
      length_final = code_clone.length
      
      iterations = length_initial - length_final
      while iterations > 0
        @feedback.push(TOKENS["just_color"])
        iterations -= 1
        
      end
    end

  def feedback
    puts ""
    puts "Here's your feedback:"
    puts @feedback
    @feedback = []
  end
end

