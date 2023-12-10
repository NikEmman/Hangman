# frozen_string_literal: true
class Game
    def initialize
        @words_array =[]
    end

    def get_words
        document = File.foreach("dictionary.txt"){|line| @words_array.push(line)  if (line.size>5 && line.size<12)}
    end

    def choose_word
        get_words
        @words_array[rand(0...@words_array.size-1)]
    end

end
