# frozen_string_literal: true

# rubocop:disable Style/StringLiterals
require_relative 'game'
require "yaml"
# game starter
class Main
  def initialize
    @new_game = Game.new(nil, [], 0, "")
  end

  def reset
    @new_game.clear_screen
    @new_game = Game.new(nil, [], 0, "")
    @new_game.play
  end
end

a = Main.new

# rubocop:enable Style/StringLiterals
