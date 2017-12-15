class Order
  attr_reader :state , :buy_list

  def initialize(buy_list = [])
    @state = "pending"
    @buy_list = buy_list
  end

  def pay!
    @state = "paid"
  end

  def items
    @buy_list
  end

  def total_price
    sumprice = 0

    @buy_list.reduce(0) {
      |sumprice, buy_list| sumprice + buy_list[:price] * buy_list[:quantity]
    }
  end
end
