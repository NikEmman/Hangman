require_relative 'speech'
require "pry-byebug"

# rubocop:disable Style/StringLiterals
# frozen_string_literal: true
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
    File.foreach("dictionary.txt") { |line| @words_array.push(line) if line.size > 5 && line.size < 12 }
  end

  def choose_secret_word
    words_pool
    @secret_word = @words_array[rand(0...@words_array.size - 1)]
    hash_secret_word
  end

  def new_load_help
    case @welcome_input
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
    Speech.new.help
    gets
  end

  def hash_secret_word
    @hashed_word = "_" * secret_word.size
  end

  def check_secret_word
    hashed_word = @hashed_word.chars
    secret_word.chars.each_with_index do |char, index|
      hashed_word[index] = char  if char == @guess
    end
    Speech.new.wrong_guess(@guess) if !secret_word.include?(@guess)
   @hashed_word = hashed_word.join
  end


  def welcome
    Speech.new.welcome
    @welcome_input = gets.chomp
  end

  def request_guess
    Speech.new.request_guess
    @guess = gets.chomp.upcase
  end

  def valid_input?(guess)
    ("A".."Z").to_a.include?(guess)
  end

  def validated_guess
    loop do
      request_guess
      break if valid_input?(@guess)

      Speech.new.wrong_input
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

  def update_round
    @round = guesses.size
  end

  def end?
    @hashed_word == @secret_word || @round == 10
  end

  def reset?
    Speech.new.reset
    a = gets.chomp
    true if a.upcase == "Y"
  end

  def start
    
      if secret_word.nil?
        welcome
        new_load_help
       choose_secret_word
      end
    loop do
      validated_guess
      update_guesses
      check_secret_word
      update_round
      display_hashed_word
      display_guesses
      binding.pry
      break if end?
      # check for restart
      # restart (by Game.new)
    end
  end
  # check guess vs secret word
  # display board with hanged man and guesses[]
end

a = Game.new
a.start
# rubocop:enable Style/StringLiterals
