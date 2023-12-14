
require_relative 'color'

# text class
class Speech
  WELCOME_TEXT = "----------------------------------------------WELCOME TO HANGMAN----------------------------------


To start a new game type [#{Color.new.cyan("new")}], to load a saved game type [#{Color.new.brown("load")}].

To learn about the game rules type [#{Color.new.green("help")}]."
  HELP_TEXT = "At game start a #{Color.new.red("secret word")} is chosen, between 6 and 11 letters
then you get to guess a letter that you believe exists in the #{Color.new.red("secret word")}.

If your guess is correct, all cases of the letter will appear in the #{Color.new.red("secret word")} like :

_ _ A _ _ A _

If not, the #{Color.new.blue("GALLOWS")} start building like :
    _______
   |/      |
   |
   |
   |
   |
  _|___


  step by step until the man is hanged and you lose:
   _______
   |/      |
   |      (_)
   |      \\|/
   |       |
   |      / \\
  _|___

  In total you get to make 9 mistakes, at 10 #{Color.new.red("BAM!")}

  Press [ENTER] to continue" # W_I_P
  WRONG_INPUT = "\nWrong input, type a single letter of the #{Color.new.red("ENGLISH")} alphabet\n"
  REQUEST_GUESS = "\nType a letter to enter your guess:"
  TOO_HARD = "\n#{Color.new.bg_red("It was too hard, huh?")} Ok, try again\n"
  RESET = "\nIf you want to #{Color.new.red("play again")}, type [Y]"
  CORRECT_GUESS = "You #{Color.new.green("nailed it")}, let's go!"
  GUESS_EXISTS = "\nYour guess has already been chosen\n"
  WON = "You are smarter than you look! #{Color.new.green('You won')}!!!"
  SAVED = "#{Color.new.cyan("GAME SAVED !")}"
  def welcome
    puts WELCOME_TEXT
  end

  def help
    puts HELP_TEXT
  end

  def saved 
    puts SAVED
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
    puts "_|___                -----------------Oh noes! #{Color.new.red('You lost')}----------"
    puts "\nThe secret word was #{Color.new.green(word)}"
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
      puts '______'
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
