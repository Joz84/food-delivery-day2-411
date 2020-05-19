require "csv"
require_relative "../models/meal.rb"


class MealRepository
  def initialize(csv_file)
    @meals = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def find(meal_id)
    @meals.find { |meal| meal.id == meal_id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, {headers: :first_row, header_converters: :symbol}) do |row|
      id = row[:id].to_i
      name = row[:name]
      price = row[:price].to_i
      @meals << Meal.new(id: id, name: name, price: price)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

end
