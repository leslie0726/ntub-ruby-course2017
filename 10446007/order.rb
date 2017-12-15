class Order
  attr_accessor :state
  attr_reader :products

  def initialize(products=[])
    @state = "pending"
    @products = products
  end

  def pay!
    @state = "paid"
  end

  def items
    @products
  end

  def total_price
    amount = 0
    @products.reduce(0) {|amount, products| amount + products[:price] * products[:quantity]}
  end
end


