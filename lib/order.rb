require_relative 'price'

class Order

  def initialize(price = Price.new)
    @order = []
    @price = price
  end

  def add(dish_price_quantity)
    order << dish_price_quantity
    printer
  end

  def confirm(customer_input_price)
    price.confirm(customer_input_price, order)
  end

  private

  attr_reader :order, :price

  def printer
    three_new_lines
    puts "Current order:"
    one_new_line
    order.each do |dish|
      puts "#{dish[:quantity]} #{dish[:name]}"
    end
    one_new_line
    puts "Total: #{price.total_cost(order)} silver sickles"
    three_new_lines
  end

  def three_new_lines
    puts "\n\n\n"
  end

  def one_new_line
    puts "\n"
  end

end
