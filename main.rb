# frozen_string_literal: true

require_relative 'game'
require "yaml"

class Main
  def initialize
    @welcome_input = ""
    @new_game = nil
  end

  def welcome
    Speech.new.welcome
    @welcome_input = gets.chomp.downcase
  end

  def valid_welcome_input?
    %w[help new load].include?(@welcome_input.downcase)
  end

  def validated_input
    welcome
    loop do
      break if valid_welcome_input?

      Speech.new.too_hard
      welcome
    end
  end

  def new_load_help
    while @welcome_input == "help"
 
      Game.new.display_help
      Game.new.clear_screen
      welcome
    end
   if @welcome_input == "new"
      @new_game = Game.new
      @new_game.choose_secret_word
   else
     @new_game = Game.game_load
   end
  end

  def start 
    validated_input
    new_load_help
    @new_game.play
  end
  
end

Main.new.start
