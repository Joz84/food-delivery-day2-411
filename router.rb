class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      action = display_menu
      print `clear`
      get_actions(action)
    end
    puts "Goodbye my friend!"
  end

  private

  def display_menu
    puts "--------------------"
    puts "------- Menu -------"
    puts "--------------------"

    puts "Choose your action :"
    puts "0 - Quit"
    puts "1 - List meals"
    puts "2 - Add a meal"
    puts "3 - List customers"
    puts "4 - Add a customer"

    print ">"
    return gets.chomp.to_i
  end

  def get_actions(action)
    case action
    when 0 then @running = false
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    else
      puts "Try again... :("
    end
  end

end

