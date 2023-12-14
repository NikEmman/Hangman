# frozen_string_literal: true

require_relative 'speech'

# this is my game controller
class Game
  attr_accessor :secret_word, :guesses, :round, :hashed_word

  def initialize(secret_word = nil, guesses = [], round = 0, hashed_word = "")
    @words_array = []
    @guesses = guesses
    @hashed_word = hashed_word
    @round = round
    @secret_word = secret_word
    @welcome_input = ""
  end

  def words_pool
    words_array = []
    File.foreach("dictionary.txt") { |line| words_array.push(line) if line.size > 6 && line.size < 12 }
    words_array
  end

  def choose_secret_word
    words = words_pool
    @secret_word = words[rand(0...words.size - 1)].strip.upcase
    hash_secret_word
  end

  def display_help
    clear_screen
    Speech.new.help
    gets
  end

  def hash_secret_word
    @hashed_word = "_" * secret_word.size
  end

  def check_secret_word(secret, hashed, guess)
    hashed_word = hashed.chars
    secret_word = secret.chars
    if secret_word.include?(guess)
      Speech.new.correct_guess
      secret_word.each_with_index do |char, index|
        hashed_word[index] = guess if char == guess
      end
    elsif guess == "SAVE"
        game_save
        Speech.new.saved
    else
      Speech.new.wrong_guess(guess)
      @round += 1
    end
    @hashed_word = hashed_word.join
  end

  def request_guess
    Speech.new.request_guess
    @guess = gets.chomp.upcase
  end

  def valid_guess?(guess)
    valid_characters = ("A".."Z").to_a << "SAVE"
    valid_characters.include?(guess)
  end

  def validated_guess
    loop do
      request_guess
      break if valid_guess?(@guess) && @guesses.none?(@guess)
      @guesses.include?(@guess) ? Speech.new.guess_exists : Speech.new.wrong_input
    end
  end

  def update_guesses
    guesses.push(@guess) unless @guess == "SAVE"
  end

  def display_hashed_word
    Speech.new.hashed_word(@hashed_word)
  end

  def display_guesses
    Speech.new.guesses(@guesses)
  end

  def lost?
    @round == 10
  end

  def win?
    @hashed_word == @secret_word
  end

  def reset?
    Speech.new.reset
    gets.chomp.upcase == "Y"
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def game_save
    File.write("save00.yml", YAML.dump(self))
  end

  def self.game_load
    YAML.load_file("save00.yml", permitted_classes: [Game])
  end

  def reset_game
    return unless reset?
    Game.new.start
  end

  def play
    loop do
      display_hashed_word
      display_guesses
      Speech.new.draw_hanged_man(@round)
      validated_guess
      clear_screen
      update_guesses
      check_secret_word(@secret_word, @hashed_word, @guess)

      break if win? || lost?
    end
    lost? ? Speech.new.lost(@secret_word) : Speech.new.won
    reset_game
  end
end
