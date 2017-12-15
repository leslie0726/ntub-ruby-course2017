class Order

  attr_reader :state , :products  # 分別讀取兩個資料

  def initialize(products = [])
    @state = "pending"         # 未處理
    @products = products
  end

  def pay!
    @state = "paid"        # 已付款
  end

  def items
    @products
  end

  def total_price         # 商品總計
    total = 0
    @products.reduce(0) { |total , product| total += ( product[:quantity] * product[:price] ) }
  end

end
