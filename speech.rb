# rubocop:disable Style/StringLiterals
# frozen_string_literal: true

# text class
class Speech
  WELCOME_TEXT = %(------------------WELCOME TO HANGMAN-----------------
To start a new game type [new], to load a saved game type [load], to learn about the game rules type [help]
) # W_I_P
  HELP_TEXT = %( This is help text, i hope it helped, press [ENTER] to continue) # W_I_P
  WRONG_INPUT = "Wrong input, type a single letter of the English alphabet"
  REQUEST_GUESS = "Type a letter to enter your guess:"
  WRONG_GUESS =
  TOO_HARD = "It was too hard, huh? Ok, try again"
  RESET = "If you want to play again, type [Y]"
  HASHED_WORD = 
  GUESSES = "Your guesses for far are : #{@guesses}"
  def initialize
    @guess = ""
    @guesses =[]
    @hashed = ""
  end

  def welcome
    puts WELCOME_TEXT
  end

  def help
    puts HELP_TEXT
  end

  def wrong_input
    puts WRONG_INPUT
  end

  def guesses(guesses)
    puts "Your guesses for far are : #{guesses}"
  end

  def hashed_word(hashed)
    puts "#{hashed}"
  end

  def request_guess
    puts REQUEST_GUESS
  end

  def wrong_guess(char)
    puts "The letter #{char} does not exit in the Secret Word !!"
  end

  def too_hard
    puts TOO_HARD
  end

  def reset
    puts RESET
  end
end
# rubocop:enable Style/StringLiterals
