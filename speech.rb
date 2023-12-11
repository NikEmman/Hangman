# rubocop:disable Style/StringLiterals
# frozen_string_literal: true

require_relative "game"
# text class
class Speech
  WELCOME_TEXT = %(------------------WELCOME TO HANGMAN-----------------
To start a new game type [new], to load a saved game type [load], to learn about the game rules type [help]
) # W_I_P
  HELP_TEXT = %( This is help text, i hope it helped, press [ENTER] to continue) # W_I_P
  WRONG_INPUT = "Wrong input, type a single letter of the English alphabet"
  REQUEST_GUESS = "Type a letter to enter your guess:"
  WRONG_GUESS = "The letter #{char} does not exit in the Secret Word !!"
  TOO_HARD = "It was too hard, huh? Ok, try again"
  RESET = "If you want to play again, type [Y]"
  def welcome
    puts WELCOME_TEXT
  end

  def help
    puts HELP_TEXT
  end

  def wrong_input
    puts WRONG_INPUT
  end

  def request_guess
    puts REQUEST_GUESS
  end

  def wrong_guess(_char)
    puts WRONG_GUESS
  end

  def too_hard
    puts TOO_HARD
  end

  def reset
    puts RESET
  end
end
# rubocop:enable Style/StringLiterals
