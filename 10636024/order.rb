class Order
  attr_accessor :state

  def initialize (product = [])
    @state = "pending"
    @products = product 
  end
  
  def pay!
    @state = "paid"
  end
  
  def items
    @products
  end
  
  def total_price
    return @products.reduce(0){|sum, product| sum + product[:quantity]*product[:price]}
  end
end
