# frozen_string_literal: true
class Welcome
    WELCOME_TEXT = %{------------------WELCOME TO HANGMAN-----------------
To start a new game type [new], to load a saved game type [load], to learn about the game rules type [help] 
} # W_I_P
HELP_TEXT = %{ } # W_I_P 
WRONG_INPUT = "Wrong input, type a single letter of the English alphabet"
REQUEST_GUESS = "Type a letter to enter your guess:"
def welcome
 puts WELCOME_TEXT
end

def help
   puts HELP_TEXT
end
 def wrong_input
    puts WRONG_INPUT
 end

 def request_guess
    puts REQUEST_GUESS
 end
end
