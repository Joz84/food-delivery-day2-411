require_relative "../views/orders_view.rb"
require_relative "../models/order.rb"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new()
  end

  def list_undelivered_orders
    # Demander au repo de orders la liste de undelivered orders
    # Demander à la vue d'afficher la liste
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display_all(undelivered_orders)
  end

  def add
    # Demander au repo de meals la liste des meals
    # Demander à la vue d'afficher la liste des meals
    # Demander à la vue de récupérer l'index de ce meals
    # Retrouver le meals en question dans la list

    meals = @meal_repository.all
    @orders_view.display_all(meals)
    index = @orders_view.ask_integer("index") - 1
    meal = meals[index]

    # Demander au repo de customers la liste des customers
    # Demander à la vue d'afficher la liste des customers
    # Demander à la vue de récupérer l'index de ce customers
    # Retrouver le customers en question dans la list

    customers = @customer_repository.all
    @orders_view.display_all(customers)
    index = @orders_view.ask_integer("index") - 1
    customer = customers[index]

    # Demander au repo de employees la liste des employees
    # Demander à la vue d'afficher la liste des employees
    # Demander à la vue de récupérer l'index de ce employees
    # Retrouver le employees en question dans la list

    employees = @employee_repository.all
    @orders_view.display_all(employees)
    index = @orders_view.ask_integer("index") - 1
    employee = employees[index]

    # Demander au Model de créer une instance de Order
    # Demander au repo de l'ajouter

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(order)

  end
end
