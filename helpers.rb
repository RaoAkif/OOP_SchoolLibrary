require './app'

module Helpers
  def response(name)
    sleep 1
    puts "\n#{name} created successfully!!!"
    sleep 1
    continue?
  end

  def continue?
    print "\nDo you wish to continue? [Y/N]: "
    answer = gets.chomp

    if answer.downcase == 'y' || answer.downcase == 'yes' || answer == ''
      clear
      select_option
    else
      exit
    end
  end

  def invalid_prompt
    clear
    puts 'Incorrect selection, please try again!'

    sleep 1
  end

  def clear
    print "\e[2J\e[f"
  end

  def exit
    clear
    nil
  end
end
