# frozen_string_literal: true
require_relative 'welcome'
class Game
    attr_accessor :secret_word , :guesses
    def initialize
        @words_array =[]
        @guess
    end

    def get_words
        document = File.foreach("dictionary.txt"){|line| @words_array.push(line)  if (line.size>5 && line.size<12)}
    end

    def choose_word
        get_words
        secret_word = @words_array[rand(0...@words_array.size-1)]
    end

    def get_user_guess
       Welcome.new.request_guess
       @guess = gets.chomp.upcase
       
    end

    def validate
      if @guess.size == 1
        true
      else
        Welcome.new.wrong_input
        false
      end
    end
    
    def validated_guess
      input = ""
      loop do
         input = get_user_guess
         break if validate
      end
      @guess = input 
    end

    def update_guesses
      guesses.push(@guess)
    end
end

a = Game.new.validated_guess

