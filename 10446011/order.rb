class Order
  attr_accessor :status
  attr_accessor :products
  
  def initialize(products=[])
    @status = "pending"
    @products = products
  end
  
  def state
    @status 
  end

  def pay!
    @status = "paid"
  end

  def items
    @products
  end

  def total_price   
    @products.inject(0) {|sum, hash| sum + hash[:quantity] * hash[:price]}
  end
end