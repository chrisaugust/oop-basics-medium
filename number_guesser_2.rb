# In the previous exercise, you wrote a number guessing game that determines a secret 
# number between 1 and 100, and gives the user 7 opportunities to guess the number.
# 
# Update your solution to accept a low and high value when you create a GuessingGame object, 
# and use those values to compute a secret number for the game. You should also change the 
# number of guesses allowed so the user can always win if she uses a good strategy. 
# You can compute the number of guesses with: 
# 
# Math.log2(size_of_range).to_i + 1


class GuessingGame
  attr_reader :number
  attr_accessor :low_val, :high_val, :guesses

  def initialize
    @low_val = get_low_val
    @high_val = get_high_val
    @number = rand(low_val..high_val)
    @guesses = Math.log2(high_val - low_val).to_i + 1
  end

  def play
    system 'clear'
    while guesses > 0
      display_remaining_guesses
      guess = get_player_guess
      check_against_number(guess)
      self.guesses -= 1
      player_loses if guesses == 0
    end    
  end

  private

  def get_low_val
    puts
    puts "Choose a low value for a range of numbers: "
    low_val = gets.chomp.to_i
  end

  def get_high_val
    puts
    puts "Choose a high value for the range of numbers: "
    high_val = gets.chomp.to_i
  end
  
  def display_remaining_guesses
    if guesses == 1
      puts "You have #{guesses} guess remaining."
    else
      puts "You have #{guesses} guesses remaining."
    end
  end

  def get_player_guess
    loop do
      print "Enter a number between #{low_val} and #{high_val}: "
      guess = gets.chomp.to_i
      return guess if (low_val..high_val).cover?(guess)
      puts "Invalid guess"
    end
  end

  def check_against_number(guess)
    case 
    when guess == number
      puts "That's the number!"
      player_wins
    when guess > number
      puts "Your guess is too high"
    when guess < number
      puts "Your guess is too low"
    end
  end

  def player_wins
    puts "You won!"
    exit(1)
  end

  def player_loses
    puts "You have no more guesses. You lost!"
    exit(1)
  end
end


game = GuessingGame.new
game.play
