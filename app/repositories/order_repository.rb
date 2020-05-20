require_relative "base_repository.rb"
require_relative "../models/order.rb"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @elements = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
    # @elements.reject(&:delivered?)
  end


  private

  def new_element(row)
    Order.new(
      id: row[:id].to_i,
      meal: @meal_repository.find(row[:meal_id].to_i),
      customer: @customer_repository.find(row[:customer_id].to_i),
      employee: @employee_repository.find(row[:employee_id].to_i),
      delivered: row[:delivered] == "true"
      )
  end

  def element_headers
    [ "id", "meal_id", "employee_id", "customer_id", "delivered" ]
  end
end
