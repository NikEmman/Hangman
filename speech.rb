# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/AbcSize
# rubocop:disable Style/StringConcatenation
# rubocop:disable Metrics/ClassLength
# frozen_string_literal: true

require_relative 'color'

# text class
class Speech
  WELCOME_TEXT = "---------------------------WELCOME TO HANGMAN-----------------------


To start a new game type [new], to load a saved game type [load], to learn about the game rules type [help])"
  HELP_TEXT = %( This is help text, i hope it helped, press [ENTER] to continue) # W_I_P
  WRONG_INPUT = "\nWrong input, type a single letter of the English alphabet\n"
  REQUEST_GUESS = "\nType a letter to enter your guess:"
  TOO_HARD = "\nIt was too hard, huh? Ok, try again\n"
  RESET = 'If you want to play again, type [Y]'
  CORRECT_GUESS = "\nYou nailed it, let's go!" + "\n"
  GUESS_EXISTS = "\nYour guess has already been chosen\n"
  WON = "You are smarter than you look! #{Color.new.green('You won')}!!!"
  def initialize
    @guess = ''
    @guesses = []
    @hashed = ''
  end

  def welcome
    puts WELCOME_TEXT
  end

  def help
    puts HELP_TEXT
  end

  def guess_exists
    puts GUESS_EXISTS
  end

  def wrong_input
    puts WRONG_INPUT
  end

  def guesses(guesses)
    puts "\n" + "Your guesses for far are : #{guesses.join(' , ')}"
  end

  def hashed_word(hashed)
    puts "\n#{hashed.chars.join(' ')}\n"
  end

  def request_guess
    puts REQUEST_GUESS
  end

  def correct_guess
    puts CORRECT_GUESS
  end

  def wrong_guess(char)
    puts "The letter #{char} does not exit in the #{Color.new.red('secret word')} !!"
  end

  def too_hard
    puts TOO_HARD
  end

  def lost(word)
    puts '  _______'
    puts ' |/      |'
    puts ' |      (_)'
    puts ' |      \\|/'
    puts ' |       |'
    puts ' |      / \\'
    puts "_|___   Oh noes! #{Color.new.red('You lost')}"
    puts "The secret word was #{word}"
  end

  def won
    puts WON
  end

  def reset
    puts RESET
  end

  def draw_hanged_man(round)
    case round
    when 0
      puts '          '
      puts '          '
      puts '  '
      puts '  '
      puts '  '
      puts '  '
      puts '     '
    when 1
      puts '          '
      puts '          '
      puts '  '
      puts '  '
      puts '  '
      puts '  '
      puts '_____'
    when 2
      puts '          '
      puts ' |        '
      puts ' |'
      puts ' |'
      puts ' |'
      puts ' |'
      puts '_|___'
    when 3
      puts '  _______'
      puts ' |/      |'
      puts ' |'
      puts ' |'
      puts ' |'
      puts ' |'
      puts '_|___'
    when 4
      puts '  _______'
      puts ' |/      |'
      puts ' |      (_)'
      puts ' |'
      puts ' |'
      puts ' |'
      puts '_|___'
    when 5
      puts '  _______'
      puts ' |/      |'
      puts ' |      (_)'
      puts ' |       |'
      puts ' |'
      puts ' |'
      puts '_|___'
    when 6
      puts '  _______'
      puts ' |/      |'
      puts ' |      (_)'
      puts ' |      \\|'
      puts ' |'
      puts ' |'
      puts '_|___'
    when 7
      puts '  _______'
      puts ' |/      |'
      puts ' |      (_)'
      puts ' |      \\|/'
      puts ' |'
      puts ' |'
      puts '_|___'
    when 8
      puts '  _______'
      puts ' |/      |'
      puts ' |      (_)'
      puts ' |      \\|/'
      puts ' |       |'
      puts ' |'
      puts '_|___'
    when 9
      puts '  _______'
      puts ' |/      |'
      puts ' |      (_)'
      puts ' |      \\|/'
      puts ' |       |'
      puts ' |      /'
      puts '_|___'
    end
  end
end

# rubocop:enable Metrics/ClassLength
# rubocop:enable Style/StringConcatenation
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
