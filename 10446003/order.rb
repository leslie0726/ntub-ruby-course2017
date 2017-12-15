# 作業 004

class Order
  attr_reader :state, :goods

  def initialize(goods = []) #給定預設值
    @state = "pending"
    @goods = goods
  end

  def pay!
    @state = "paid"
  end

  def items
    @goods
  end

  def total_price
    goods.reduce(0) {|sum, good| sum + good[:quantity] * good[:price]}

  end

end
