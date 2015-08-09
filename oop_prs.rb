require 'pry'

class Computer

  def choice
    computer_choice = Game::OPTIONS.keys.sample
    puts "The computer chose #{Game::OPTIONS[computer_choice]}."
    computer_choice
  end
end

class Player
  attr_accessor  :name, :player_choice

  def initialize
    @name = get_avatar
  end

  def get_avatar
    puts "What is your name?"
    avatar = gets.chomp.capitalize
  end

  def choice
    begin
      puts
      puts "#{name}, choose between [P]aper, [R]ock or [S]cissors"
      player_choice = gets.chomp.downcase
    end until Game::OPTIONS.keys.include?(player_choice)
      puts ""
      puts "#{name} chose #{Game::OPTIONS[player_choice]}."
      player_choice 
  end
end

class Game
  OPTIONS = { "p" => "paper", "r" => "rock", "s" => "scissors"}
  attr_accessor :player, :computer

  def welcome
    puts "Welcome to Paper, Rock, Scissors."
    puts
  end

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def play
    pc = player.choice
    cc = computer.choice
    compare_choice(pc, cc)
    print_winner(pc)
    play_again?
  end

  def compare_choice(pc, cc)
    if pc == cc
      puts "It's a tie!"
      play_again?
    elsif (pc == 'p' && cc == 'r') || (pc == 'r' && cc == 's') || (pc == 's' && cc == 'p')
      print_winner(pc)
      play_again?
    else
      puts
      puts "Computer AI wins!"
      play_again?
    end
  end

  def print_winner(pc)
    case pc
    when 'p'
      puts ""
      puts "Congratulations you won! Paper covers Rock!"
    when 'r'
      puts ""
      puts "Congratulations you won! Rock smashes Scissors!"
    when 's'
      puts ""
      puts "Congratulations you won! Scissors cuts Paper!"
    end
  end

  def play_again?
    loop do
      puts "Want to play again? [Y]es or [N]o?"
      answer = gets.chomp.downcase
      if answer == 'n'
        exit
      elsif answer == 'y'
        play
      end 
    end
  end
end

game = Game.new
game.play
