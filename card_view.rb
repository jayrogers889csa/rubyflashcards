
module CardView

  def reset_screen
    clear_screen!
    move_to_home!
  end

  def initial_prompt
    show_definition
    question_prompt
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
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def start
  puts '__   _______   _   ______     _____   __        _____    ______   __   __   _____    _____    __ __    _____   ______  _   '
 puts '/\_\/\_______)\/_/\/ ____/\  /\_____\ /\_\      /\___/\  / ____/\ /\_\ /_/\ /\ __/\  /\___/\  /_/\__/\ /\ __/\ / ____/\/_/\ '
 puts '\/_/\(___  __\/\_\/) ) __\/ ( (  ___/( ( (     / / _ \ \ ) ) __\/( ( (_) ) )) )__\/ / / _ \ \ ) ) ) ) )) )  \ \) ) __\/) ) )'
puts '/\_\ / / /         \ \ \    \ \ \_   \ \_\    \ \(_)/ /  \ \ \   \ \___/ // / /    \ \(_)/ //_/ /_/_// / /\ \ \\ \ \ /_/ / '
 puts '/ / /( ( (          _\ \ \   / / /_\  / / /__  / / _ \ \  _\ \ \  / / _ \ \\ \ \_   / / _ \ \\ \ \ \ \\ \ \/ / /_\ \ \\_\_\ '
puts '( (_(  \ \ \        )____) ) / /____/ ( (_____(( (_( )_) ))____) )( (_( )_) )) )__/\( (_( )_) ))_) ) \ \) )__/ /)____) )/_/\ '
 puts '\/_/  /_/_/        \____\/  \/_/      \/_____/ \/_/ \_\/ \____\/  \/_/ \_\/ \/___\/ \/_/ \_\/ \_\/ \_\/\/___\/ \____\/ )_)/ '
  end

  def show_score
    puts "\e[5m\e[7m      --===SCORE===--      \n     You: #{score} | Train: #{train_score}     \033[0m"
  end

  def remaining_questions
    puts "--------------------------------"
    puts "    Questions Remaining: #{38-score}"
    puts "--------------------------------"
  end

   def guess_term(term)
    if controller.check_guess(term)
      puts "YEAAAAHH You got it right!"
      self.score += 1
      controller.got_term_right(term)
      random = rand(2)
      case random
      when 0
        system("cowsay 'YOU GOT IT RIGHT, BRO!'")
      when 1
        system("cowsay -f sheep 'MUCH SHEEP! ANSWER VERY WOW!'")
      end
    else
      self.train_score += 1
      puts "I sorry...life sucks and you got it wrong"
      puts "Have a train....cause you need to train more...."
      puts "Want some aloe for that burn?"
      sleep(4)
      system('sl -Fa')
    end
  end
end
