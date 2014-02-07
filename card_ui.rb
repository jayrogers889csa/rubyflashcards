require_relative 'card_controller.rb'
require_relative 'card_view.rb'

class CardUI
  include CardView
  attr_reader :controller, :view
  attr_accessor :score, :train_score

  def initialize(control)
    @controller = control
    @score = 0
    @train_score = 0
  end

  def run
    loop do
      clear_screen!
      move_to_home!
      start
      show_score
      remaining_questions
      show_definition
      puts controller.display_definition
      question_prompt
      guess_term(gets.chomp)
      if win_check?
        puts "HELL YEAH YOU DID IT!"
        break
      end
      continue_or_end_prompt
      user_choice = gets.chomp.downcase
      break if user_choice == "q"
    end
  end

  def win_check?
    return true if 38-score == 0
  end

end

game = CardUI.new(CardController.new)
game.run

