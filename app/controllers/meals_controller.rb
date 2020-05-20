require_relative "../views/meals_view.rb"
require_relative "../models/meal.rb"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new()
  end

  def list
    # Demander au repo de meals de nous donner la liste de meals et la stocker
    meals = @meal_repository.all
    # Demander à la vue d'afficher la liste des meals
    @view.display_all(meals)
  end

  def add
    # Demander à la vue de demander au user le nom du menu
    name = @view.ask_string("name")
    # Demander à la vue de demander au user le prix du menu
    price = @view.ask_integer("price")
    # Demander au model de créer une instace de meal
    meal = Meal.new(name: name, price: price)
    # Demander au repo d'ajouter ce meal à la liste de meals
    @meal_repository.add(meal)
  end
end
