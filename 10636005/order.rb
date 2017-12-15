class Order
  attr_reader :state, :items
  def initialize(products=[])
    @state = "pending"
    @items = products
  end
  
  def pay!
    @state = "paid"
  end
  
  def total_price
    # items.count
    items.inject(0) { |total, product| total + (product[:quantity] * product[:price]) }
  end
end
