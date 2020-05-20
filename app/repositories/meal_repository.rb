require_relative "base_repository.rb"
require_relative "../models/meal.rb"

class MealRepository < BaseRepository

  private

  def new_element(row)
      Meal.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_i)
  end

  def element_headers
    ["id", "name", "price"]
  end

end
