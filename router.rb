class Router
  def initialize(meals_controller, customers_controller, employee_repository, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employee_repository = employee_repository
    @orders_controller = orders_controller
    @running = true
  end

  def run
    employee = sign_in
    # employee = @session_controller.sign

    while @running
      if employee.manager?
        action = display_manager_menu
        print `clear`
        get_manager_actions(action)
      else
        action = display_delivery_guy_menu
        print `clear`
        get_delivery_guy_actions(action)
      end
    end
    puts "Goodbye my friend!"
  end

  private

  def sign_in
    # demander à l'utilisateur son username
    # demander à l'utilisateur son password
    # demander au repo  d'employee de retrouver l'employee par rapport à son username
    # si on a retrouvé l'employee et si en plus son password est le même
    #   afficher un message de validation
    #   return employee
    # sinon
    #  rejouer sign_in
    puts "username?"
    print ">"
    username = gets.chomp
    puts "password?"
    print ">"
    password = gets.chomp
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
        puts "Good, Welcome!!!"
        return employee
    else
      puts "Bad credentials!!!"
      sign_in
    end
  end



  def display_manager_menu
    puts "--------------------"
    puts "------- Menu -------"
    puts "--------------------"

    puts "Choose your action :"
    puts "0 - Quit"
    puts "1 - List meals"
    puts "2 - Add a meal"
    puts "3 - List customers"
    puts "4 - Add a customer"
    puts "5 - List undelivered orders"
    puts "6 - Add an order"

    print ">"
    return gets.chomp.to_i
  end

  def get_manager_actions(action)
    case action
    when 0 then @running = false
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    else
      puts "Try again... :("
    end
  end




end

