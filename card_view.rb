
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

  def show_score
    puts "\e[5m\e[7m==SCORE: #{score}==\033[0m"
  end
end
