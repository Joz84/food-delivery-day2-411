require_relative "base_repository.rb"
require_relative "../models/employee.rb"

class EmployeeRepository < BaseRepository
  undef :add

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end


  private

  def new_element(row)
      Employee.new(
        id: row[:id].to_i,
        username: row[:username],
        password: row[:password],
        role: row[:role]
        )
  end

  def element_headers
    [ "id", "username", "password", "role" ]
  end

end
