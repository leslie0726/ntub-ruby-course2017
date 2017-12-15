class Order
  attr_accessor :state

  def initialize(products = nil)
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
    for product in @products
      price, quantity = product[:price], product[:quantity]
      amount += price * quantity if quantity >= 0 and price >= 0
    end
    amount
  end

end