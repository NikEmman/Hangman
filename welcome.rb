# frozen_string_literal: true
class Welcome
    WELCOME_TEXT = %{------------------WELCOME TO HANGMAN-----------------
To start a new game type [new], to load a saved game type [load], to learn about the game rules type [help] 
} # W_I_P
HELP_TEXT = %{ } # W_I_P 

def welcome
 puts WELCOME_TEXT
end

def help
   puts HELP_TEXT
end

end
