class Order
  attr_reader :state
  attr_reader :products         #可讀

  def initialize(products=[])
    @state = "pending"  #狀態為未處理
    @products = products
  end
  
  def pay!
    @state = "paid"     #狀態為付款
  end
  
  def items
    @products           #商品筆數
  end

  def total_price
    total = 0
    @products.reduce(0) { |total, product| total + product[:quantity] * product[:price] }
  end

end
