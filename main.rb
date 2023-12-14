# rubocop:disable Style/StringLiterals
require_relative 'game'

class Main
  def initialize
    @new_game = Game.new(nil, [], 0, "")
  end

  def start
    @new_game.start
    reset while @new_game.reset? == true
  end

  def reset
    @new_game.clear_screen
    @new_game = Game.new(nil, [], 0, "")
    @new_game.start
  end
end
Main.new.start
# rubocop:enable Style/StringLiterals
