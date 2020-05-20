require_relative "base_repository.rb"
require_relative "../models/customer.rb"

class CustomerRepository < BaseRepository

  private

  def new_element(row)
      Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address])
  end

  def element_headers
    ["id", "name", "address"]
  end

end
