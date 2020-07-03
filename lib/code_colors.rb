
require "colorize"
require "pry"

module CodeColors
  COLORS = Array.new(["r","g","b","y","m","c"])
  CODES = {"r" => :light_red,
  "g" => :green,
  "b" => :blue,
  "y" => :light_yellow,
  "m" => :magenta,
  "c" => :cyan}
  def colorize_code(code)
    colorized_code = code.map { |color| ("  " + color + "  ").colorize(:color => :light_white, :background => CODES[color])
    }
    colorized_code.join
  end
  TOKENS = {"place_color" => "*".colorize(:light_red),
    "just_color" => "*".colorize(:blue)}
 
end