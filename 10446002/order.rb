class Order
  attr_reader :state
  attr_reader :products
  def initialize(product=[])
    #初始化訂單為未處狀態
    @state = "pending"
    #傳參數給實體變數
    @products = product
  end
  
  def pay!
    #已付款狀態
    @state = "paid"
  end
  
  def items
    #回傳products的商品項目數
    @products
  end

  def total_price
    #計算products的訂單金額
    total = 0
    @products.reduce(0) { |total, product| total + product[:quantity] * product[:price] }
  end
end
