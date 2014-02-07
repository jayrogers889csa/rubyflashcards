require_relative 'card_controller.rb'

class CardUI
  attr_reader :controller
  attr_accessor :score

  def initialize(control)
    @controller = control
    @score = 0
  end

  def run
    loop do
      clear_screen!
      move_to_home!
      show_score
      show_definition
      question_prompt
      guess_term(gets.chomp)
      continue_or_end_prompt
      user_choice = gets.chomp.downcase
      break if user_choice == "q"
    end
  end

  def show_score
    puts "\e[5m\e[7m==SCORE: #{score}==\033[0m"
  end

  def continue_or_end_prompt
    puts "Press enter to continue, \"q\" to quit"
  end

  def question_prompt
    puts "\e[31mChoose your fate:\033[0m"
  end

  def show_definition
    puts "\e[95m-The definition is:\033[0m"
    #andrew.kill(eric\'s_puppy)
    puts controller.display_definition
  end

  def guess_term(term)
    if controller.check_guess(term)
      puts "YEAAAAHH You got it right!"
      self.score += 1
      system("cowsay 'YOU GOT IT RIGHT, BRO!'")
    else
      puts "I sorry...life sucks and you got it wrong"
      puts "Have a train."
      sleep(2)
      system('sl')
    end
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

end

game = CardUI.new(CardController.new)
game.run

