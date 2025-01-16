class HangmanGame
  def initialize(total_words)
    @total_words = total_words
    @level = 1
    @guessed_letters = []
    @chances = 5
  end

  # Method to play the Hangman game at a specific level
  def play_level
    if @level > 5
      puts "*-------------------------------------------------------------------*"
      puts "*   Congratulations! You've reached the maximum level (Level 5)!    *"
      puts "*-------------------------------------------------------------------*"
      exit
    end

    random_category, words = @total_words.to_a.sample
    guess_word = words.sample

    game_header # Display the game header
    puts "Level #{@level}"
    puts "Category: #{random_category}"
    puts "----------------------------------"

    if play_hangman(guess_word, random_category)
      if @level == 5
        puts "Congratulations! You completed the maximum level (Level 5)!"
        exit
      else
        puts "*-------------------------------------------------------------------*"
        puts "*    Would you like to continue to level #{@level + 1}? (YES/NO)     *"
        puts "*-------------------------------------------------------------------*"
        continue = gets.chomp.upcase
        if continue == "YES"
          @level += 1
          play_level
        else
          puts "*-------------------------------------------------------------------*"
          puts "*         Thanks for playing! You completed level #{@level}.         *"
          puts "*-------------------------------------------------------------------*"
          exit
        end
      end
    else
      puts "*-------------------------------------------------------------------*"
      puts "*              You didn't guess the word. Game over!                *"
      puts "*-------------------------------------------------------------------*"
      exit
    end
  end

  # Method to play the actual Hangman game
  def play_hangman(guess_word, category)
    @guessed_letters.clear
    @chances = 5
    display_word = "_ " * guess_word.length

    while @chances > 0
      puts "Current word: #{display_word}"
      puts "You have #{@chances} chances left."
      puts "Enter a letter (a to z):"
      
      guess = gets.chomp.downcase
      
      # Validate the user input
      if guess.length != 1 || !('a'..'z').include?(guess)
        puts "Please enter a valid single letter."
        next
      end
      
      # Check if the user has already guessed the letter
      if @guessed_letters.include?(guess)
        puts "You already guessed '#{guess}'. Try again."
        next
      end
      
      # Add the guessed letter to the list
      @guessed_letters << guess
      
      # Check if the guessed letter is in the word
      if guess_word.include?(guess)
        puts "*----------------------*"
        puts "*    Correct guess!    *"
        puts "*----------------------*"
      else
        puts "*----------------------*"
        puts "*    Wrong guess!      *"
        puts "*----------------------*"
        @chances -= 1
      end
      
      # Display the word with the guessed letters
      display_word = ""
      guess_word.each_char do |char|
        if @guessed_letters.include?(char)
          display_word += char
        else
          display_word += "_"
        end
      end

      # Check if the user has guessed the word correctly
      if display_word == guess_word
        puts "*--------------------------------------------------------*"
        puts "*  Congratulations! You guessed the word: #{guess_word}  *"
        puts "*--------------------------------------------------------*"
        return true
      end
    end

    if @chances == 0
      puts "*-------------------------------------------------------------------*"
      puts "*  Sorry, you've run out of chances. The word was :#{guess_word}    *"
      puts "*-------------------------------------------------------------------*"
    end
    false
  end

  # Method to display the game header
  def game_header
    puts "***********************************"
    puts "*    |*|   |*|                    *"
    puts "*       |*|       HANGMAN GAME    *"
    puts "*     |-----|                     *"
    puts "***********************************"
  end
end

# Define the words for each category
Animals = ["lion", "bear", "crab", "wolf", "deer", "duck", "goat", "frog", "fish", "swan"]
Sports = ["golf", "swim", "hunt", "kick", "polo", "surf", "yoga", "judo"]
Verbs = ["jump", "kick", "sing", "read", "cook", "play", "walk", "swim"]
Birds = ["swan", "duck", "crow", "dove", "eagle", "hawk", "kite"]
Fruits = ["lime", "date", "pear", "figs", "kiwi", "pear", "plum"]
Colours = ["blue", "pink", "gray", "gold", "cyan", "lime", "navy", "teal"]

# Store all the words in a hash with their respective categories
total_words = { "Animals" => Animals, "Sports" => Sports, "Verbs" => Verbs, "Birds" => Birds, "Fruits" => Fruits, "Colours" => Colours }

# Create an instance of the HangmanGame class and start playing
game = HangmanGame.new(total_words)
game.play_level
