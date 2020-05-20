require_relative "../views/customers_view.rb"
require_relative "../models/customer.rb"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new()
  end

  def list
    # Demander au repo de customers de nous donner la liste de customers et la stocker
    customers = @customer_repository.all
    # Demander à la vue d'afficher la liste des customers
    @view.display_all(customers)
  end

  def add
    # Demander à la vue de demander au user le nom du menu
    name = @view.ask_string("name")
    # Demander à la vue de demander au user le prix du menu
    address = @view.ask_string("address")
    # Demander au model de créer une instace de customer
    customer = Customer.new(name: name, address: address)
    # Demander au repo d'ajouter ce customer à la liste de customers
    @customer_repository.add(customer)
  end
end
