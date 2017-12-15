class Order
  attr_reader :state, :products

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
      total = 0
#    for product in products
#      total += product[:price]*product[:quantity]
#    end
#     total
      products.reduce(0) {|total, product| total + product[:price] * product[:quantity] }
  end
end
    
