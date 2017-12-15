class Order
  attr_reader :state , :products

  def initialize ( products = [] )
    @state="pending"
    @products=products
  end

  def pay!
    @state="paid"
  end

  def items
    @products
  end

  def total_price
    total=0
    @products.reduce(0) { |total , products| total += products[:quantity] * products[:price] }
  end
end
