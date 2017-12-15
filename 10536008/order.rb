class Order
  attr_reader :state, :products
  
  def initialize (products = [])
    @state = "pending"
    @products = products
  end
  
  def pay!
    @state = "paid"
  end
  
  def items 
    @items = products
  end
  
  def total_price
    total = 0
    for product in products
      total += product[:quantity] * product[:price]
    end
    total
  end
end
