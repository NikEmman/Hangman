# frozen_string_literal: true

require_relative 'speech'
# this is my game
class Game
  attr_accessor :secret_word, :guesses, :round, :hashed_word

  def initialize
    @words_array = []
  end

  def get_words
    File.foreach('dictionary.txt') { |line| @words_array.push(line) if line.size > 5 && line.size < 12 }
  end

  def choose_word
    get_words
    @secret_word = @words_array[rand(0...@words_array.size - 1)]
    hash_secret_word
  end

  def hash_secret_word
    @hashed_word = '_' * secret_word.size
  end

  def check_secret_word
    for n in secret_word.size - 1
      if secret_word.split[n] == @guess
        hashed_word.split[n] = secret_word.split[n]
      else
        Speech.new.wrong_guess
      end
    end
  end

  def get_user_guess
    Speech.new.request_guess
    @guess = gets.chomp.upcase
  end

  def valid_input?(guess)
    ('A'..'Z').to_a.include?(guess)
  end

  def validated_guess
    loop do
      get_user_guess
      break if valid_input?(@guess)

      Speech.new.wrong_input
    end
  end

  def update_guesses
    guesses.push(@guess)
  end

  def update_round
    @round = guesses.size
  end

  def end?(hashed_word, secret_word, round)
    hashed_word == secret_word || round == 10
  end

  def start
    # get_word where?
    loop
    next unless secret_word.nil?

    Speech.new.welcome
    choose_word

    validated_guess
    update_guesses
    check_secret_word
    update_round
    break if end?
    # check for restart
    # restart (by Game.new)
  end
  # check guess vs secret word
  # display board with hanged man and guesses[]
end

a = Game.new
a.start
