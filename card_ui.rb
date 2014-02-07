require_relative 'card_controller.rb'
require_relative 'card_view.rb'

class CardUI
  include CardView
  attr_reader :controller, :view
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
      puts controller.display_definition
      question_prompt
      guess_term(gets.chomp)
      continue_or_end_prompt
      user_choice = gets.chomp.downcase
      break if user_choice == "q"
    end
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
end

game = CardUI.new(CardController.new)
game.run

