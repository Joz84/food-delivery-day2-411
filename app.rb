require_relative "app/repositories/meal_repository.rb"
require_relative "app/repositories/customer_repository.rb"
require_relative "app/repositories/employee_repository.rb"
require_relative "app/repositories/order_repository.rb"

require_relative "app/controllers/meals_controller.rb"
require_relative "app/controllers/customers_controller.rb"
require_relative "app/controllers/orders_controller.rb"

require_relative "router.rb"

meal_repository = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new("data/customers.csv")
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new("data/employees.csv")

order_repository = OrderRepository.new("data/orders.csv", meal_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)

router = Router.new(meals_controller, customers_controller, employee_repository, orders_controller)

router.run

