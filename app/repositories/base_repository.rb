require "csv"
# require_relative "../models/meal.rb"


class BaseRepository
  def initialize(csv_file)
    @elements = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def find(element_id)
    @elements.find { |element| element.id == element_id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, {headers: :first_row, header_converters: :symbol}) do |row|
      @elements << new_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << element_headers
      @elements.each do |element|
        csv << element.csv_row
      end
    end
  end

end
