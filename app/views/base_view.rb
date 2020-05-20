class BaseView

  def display_all(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1} : #{element.to_s}"
    end
  end

  def ask_string(word)
    puts "#{word}?"
    gets.chomp
  end

  def ask_integer(word)
    puts "#{word}?"
    gets.chomp.to_i
  end

end
