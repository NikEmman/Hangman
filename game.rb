# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength
# frozen_string_literal: true

require_relative "speech"
require "yaml"
require 'pry-byebug'


# rubocop:disable Style/StringLiterals

# this is my game controller
class Game
  attr_accessor :secret_word, :guesses, :round, :hashed_word

  def initialize
    @words_array = []
    @welcome_input = nil
    @guesses = []
    @hashed_word = ""
    @round = 0
    @secret_word = nil
  end

  def words_pool
    File.foreach("dictionary.txt") { |line| @words_array.push(line) if line.size > 6 && line.size < 12 }
  end

  def choose_secret_word
    words_pool
    @secret_word = @words_array[rand(0...@words_array.size - 1)].strip.upcase
    hash_secret_word
  end

  def valid_welcome_input?
    %w[help new load].include?(@welcome_input.downcase)
  end

  def new_load_help
    case @welcome_input.downcase
    when "help"
      display_help
    when "load"
    # load_game method
    when "new"
    # no idea
    else
      Speech.new.too_hard
    end
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
    # binding.pry
  end

  def welcome
    Speech.new.welcome
    @welcome_input = gets.chomp
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
    a = gets.chomp
    true if a.upcase == "Y"
  end

  def reset_game
    return unless reset?

    Game.new.start
  end

  def clear_screen
    system("clear")
  end

  def start
    if secret_word.nil?
      loop do
        welcome
        new_load_help
        break if valid_welcome_input?
      end
      choose_secret_word
    end

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
    reset_game
  end
end

Game.new.start

# rubocop:enable Style/StringLiterals
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
