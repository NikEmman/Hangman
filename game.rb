# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength
# frozen_string_literal: true

require_relative 'speech'
require 'pry-byebug'

# rubocop:disable Style/StringLiterals

# this is my game controller
class Game
  attr_accessor :secret_word, :guesses, :round, :hashed_word, :words_array, :welcome_input

  def initialize(words_array, secret_word, guesses, round, hashed_word, welcome_input)
    @words_array = words_array
    @guesses = guesses
    @hashed_word = hashed_word
    @round = round
    @secret_word = secret_word
    @welcome_input = welcome_input
  end

  def words_pool
    File.foreach("dictionary.txt") { |line| @words_array.push(line) if line.size > 6 && line.size < 12 }
  end

  def choose_secret_word
    words_pool
    @secret_word = @words_array[rand(0...@words_array.size - 1)].strip.upcase
    hash_secret_word
  end

  def welcome
    Speech.new.welcome
    @welcome_input = gets.chomp
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
    case @welcome_input.downcase
    when "help"
      display_help
    when "load"
      # load_game method
    else
      play
    end
    reset if @new_game.reset?
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
    ("A".."Z").to_a.include?(guess)
  end

  def validated_guess
    loop do
      request_guess
      break if valid_guess?(@guess) && @guesses.none?(@guess)

      @guesses.include?(@guess) ? Speech.new.guess_exists : Speech.new.wrong_input
    end
  end

  def update_guesses
    guesses.push(@guess)
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
    true if gets.chomp.upcase == "Y"
  end

  def clear_screen
    system("clear")
  end

  def game_save
    File.write("save00.yml", YAML.dump(self))
  end

  def self.game_deserialize
    YAML.load_file(File.read("save00.yml"))
  end

  def play
    choose_secret_word if secret_word.nil?

    loop do
      validated_guess
      clear_screen
      update_guesses
      check_secret_word(@secret_word, @hashed_word, @guess)
      display_hashed_word
      display_guesses
      Speech.new.draw_hanged_man(@round)
      break if win? || lost?
    end
    lost? ? Speech.new.lost(@secret_word) : Speech.new.won
  end
end

b = Game.game_deserialize
b.play
# rubocop:enable Style/StringLiterals
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
