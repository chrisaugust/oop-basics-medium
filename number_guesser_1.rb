class GuessingGame
  attr_reader :number
  attr_accessor :guesses

  def initialize
    @number = rand(100)
    @guesses = 7
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
  
  def display_remaining_guesses
    puts "You have #{guesses} guesses remaining."
  end

  def get_player_guess
    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.chomp.to_i
      return guess if (1..100).cover?(guess)
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
