class Order
  attr_reader :status, :goods

  def initialize(goods = [])
    @status = "pending"
    @goods = goods
  end

  def state
    @status
  end

  def pay!
    @status = "paid"
  end

  def items
    @goods
  end

  def total_price
    goods.reduce(0) { |total, i| total + i[:quantity] * i[:price] }
  end

end
