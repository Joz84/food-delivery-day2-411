require_relative "app/repositories/meal_repository.rb"

require_relative "app/controllers/meals_controller.rb"
require_relative "router.rb"

meal_repository = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)

router.run









# require_relative "app/models/meal.rb"

# burger = Meal.new(name: "Burger", price: 12)

# # p burger.price


# meal_repository.add(burger)


# p meal_repository.all
