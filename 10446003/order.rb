# 作業 004

class Order
  attr_reader :status
  
  def initialize
    @status = "pending"
  end
  
  def state
    @status
  end
  
  def pay!
    @status = "paid"
  end
end

