
class Order 
  attr_accessor :state

  # products = nil ===>可讓建立Order時不須放入products (order = Order.new & order = Order.new(products) 皆可通過)
  def initialize (products = nil)
    @products = products
    @state = 'pending'
  end

  def pay!
    @state = 'paid'
  end

  def items 
    @products
  end

  # reduce會造成無法辨識+的method無法辨識 (undefined method `+') 改用inject
  def total_price
    @products.inject(0) {|sum,product| sum = sum + (product[:price]*product[:quantity])} 
  end

end

