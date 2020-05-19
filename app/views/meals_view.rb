class MealsView

  def display_all(meals)
    meals.each do |meal|
      puts "#{meal.name} - #{meal.price}€"
    end
  end

  def ask_name
    puts "name?"
    gets.chomp
  end

  def ask_price
    puts "price?"
    gets.chomp.to_i
  end

end
