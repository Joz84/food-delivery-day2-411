class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attrs={})
    @id = attrs[:id]
    @meal = attrs[:meal]
    @customer = attrs[:customer]
    @employee = attrs[:employee]
    @delivered = attrs[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def undelivered?
    !@delivered
  end

  def deliver!
    @delivered = true
  end

  def csv_row
    [@id, @meal.id, @employee.id, @customer.id, @delivered]
  end

  def to_s
    "#{meal.name} - #{employee.username} - #{customer.to_s}"
  end
end
