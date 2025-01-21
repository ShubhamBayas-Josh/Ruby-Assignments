class HangmanGame
  def initialize(total_words)
    @total_words = total_words
    @level = 1
    @guessed_letters = []
    @chances = 5
  end

  # Method to play the actual Hangman game
  def play_hangman(guess_word, category)
    @guessed_letters.clear
    @chances = 5
    display_word = "_ " * guess_word.length

    while @chances > 0
      display_current_status(display_word)
      guess = get_user_guess

      next unless valid_guess?(guess)
      
      @guessed_letters << guess
      display_word = update_display_word(guess_word, display_word)

      if word_guessed?(display_word, guess_word)
        return true
      end
    end

    game_over(guess_word)
    false
  end

  # Display current game status
  def display_current_status(display_word)
    puts "Current word: #{display_word}"
    puts "You have #{@chances} chances left."
    puts "Enter a letter (a to z):"
  end

  # Get user input for a guess
  def get_user_guess
    gets.chomp.downcase
  end

  # Validate the user input
  def valid_guess?(guess)
    if guess.length != 1 || !('a'..'z').include?(guess)
      puts "Please enter a valid single letter."
      return false
    end

    if @guessed_letters.include?(guess)
      puts "You already guessed '#{guess}'. Try again."
      return false
    end

    true
  end

  # Update the display word
  def update_display_word(guess_word, display_word)
    if guess_word.include?(display_word.strip)
      puts "*----------------------*"
      puts "*    Correct guess!    *"
      puts "*----------------------*"
    else
      puts "*----------------------*"
      puts "*    Wrong guess!      *"
      puts "*----------------------*"
      @chances -= 1
    end

    display_word = ""
    guess_word.each_char do |char|
      display_word += @guessed_letters.include?(char) ? char : "_"
    end
    display_word
  end

  # Check if the word has been guessed correctly
  def word_guessed?(display_word, guess_word)
    if display_word == guess_word
      puts "*--------------------------------------------------------*"
      puts "*  Congratulations! You guessed the word: #{guess_word}  *"
      puts "*--------------------------------------------------------*"
      true
    else
      false
    end
  end

  def game_over(guess_word)
    if @chances == 0
      puts "*-------------------------------------------------------------------*"
      puts "*  Sorry, you've run out of chances. The word was :#{guess_word}    *"
      puts "*-------------------------------------------------------------------*"
    end
  end
end

Animals = ["lion", "bear", "crab", "wolf", "deer", "duck", "goat", "frog", "fish", "swan"]
Sports = ["golf", "swim", "hunt", "kick", "polo", "surf", "yoga", "judo"]
Verbs = ["jump", "kick", "sing", "read", "cook", "play", "walk", "swim"]
Birds = ["swan", "duck", "crow", "dove", "eagle", "hawk", "kite"]
Fruits = ["lime", "date", "pear", "figs", "kiwi", "pear", "plum"]
Colours = ["blue", "pink", "gray", "gold", "cyan", "lime", "navy", "teal"]

total_words = { "Animals" => Animals, "Sports" => Sports, "Verbs" => Verbs, "Birds" => Birds, "Fruits" => Fruits, "Colours" => Colours }

game = HangmanGame.new(total_words)
game.play_level
