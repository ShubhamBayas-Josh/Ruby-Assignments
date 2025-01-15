
# Define the words for each category
Animals = ["lion", "bear", "crab", "wolf", "deer", "duck", "goat", "frog", "fish", "swan"]
Sports = ["golf", "swim", "hunt", "kick", "polo", "surf", "yoga", "judo"]
Verbs = ["jump", "kick", "sing", "read", "cook", "play", "walk", "swim"]
Birds = ["swan", "duck", "crow", "dove", "eagle", "hawk", "kite"]
Fruits = ["lime", "date", "pear", "figs", "kiwi", "pear", "plum"]
Colours = ["blue", "pink", "gray", "gold", "cyan", "lime", "navy", "teal"]

# Store all the words in a hash with their respective categories
total_words = {"Animals": Animals, "Sports": Sports, "Verbs": Verbs, "Birds": Birds, "Fruits": Fruits, "Colours": Colours}

# Play the hangman game and guess the correct word
def play_hangman(guess_word, category, level)
  guessed_letters = []
  chances = 5
  display_word = "_ " * guess_word.length
  
  while chances > 0
    puts "Current word: #{display_word}"
    puts "You have #{chances} chances left."
    puts "Enter a letter (a to z):"
    
    guess = gets.chomp.downcase
    
    # Validate the user input
    if guess.length != 1 || !('a'..'z').include?(guess)
      p "Please enter a valid single letter."
      next
    end
    
    # Check if the user has already guessed the letter
    if guessed_letters.include?(guess)
      p "You already guessed '#{guess}'. Try again."
      next
    end
    
    # Add the guessed letter to the list
    guessed_letters << guess
    
    # Check if the guessed letter is in the word
    if guess_word.include?(guess)
      p "*----------------------*"
      p "*    Correct guess!    *"
      p "*----------------------*"
    else
      p "*----------------------*"
      p "*    Wrong guess!      *"
      p "*----------------------*"
      chances -= 1
    end
    
    # Display the word with the guessed letters
    display_word = ""
    guess_word.each_char do |char|
      if guessed_letters.include?(char)
        display_word += char
      else
        display_word += "_"
      end
    end

    # Check if the user has guessed the word correctly
    if display_word == guess_word
      p "*--------------------------------------------------------*"
      p "*  Congratulations! You guessed the word: #{guess_word}  *"
      p "*--------------------------------------------------------*"
      return true 
    end
  end

  # Display the message
  if chances == 0
    p "*-------------------------------------------------------------------*"
    p "*  Sorry, you've run out of chances. The word was :#{guess_word}    *"
    p "*-------------------------------------------------------------------*"
  end
  return false  
end

# Display the game header
def game_header
  puts "***********************************"
  puts "*    |*|   |*|                    *"                   
  puts "*       |*|       HANGMAN GAME    *"
  puts "*     |-----|                     *"
  puts "***********************************"
end

# Play the game level from 1 to 5
def play_level(level, total_words)

  # Display the message if the user has reached the maximum level
  if level > 5
    p "*-------------------------------------------------------------------*"
    p "*   Congratulations! You've reached the maximum level (Level 5)!    *"
    p "*-------------------------------------------------------------------*"
    exit
  end

  random_category, words = total_words.to_a.sample
  guess_word = words.sample

  game_header # Display the game header
  puts "Level #{level}"
  puts "Category: #{random_category}"
  p "----------------------------------"

  # Play the hangman game
  if play_hangman(guess_word, random_category, level)
    if level == 5
      puts "Congratulations! You completed the maximum level (Level 5)!"
      exit
    else
      # puts ""
      p "*-------------------------------------------------------------------*"
      p "*    Would you like to continue to level #{level + 1}? (YES/NO)     *"
      p "*-------------------------------------------------------------------*"
      continue = gets.chomp.upcase
      if continue == "YES"
        play_level(level + 1, total_words)
      else
        p "*-------------------------------------------------------------------*"
        p "*         Thanks for playing! You completed level #{level}.         *"
        p "*-------------------------------------------------------------------*"
        exit
      end
    end
  else
    p "*-------------------------------------------------------------------*"
    p "*              You didn't guess the word. Game over!                *"
    p "*-------------------------------------------------------------------*"
    exit
  end
end

# Start playing the game from level 1
play_level(1, total_words)
