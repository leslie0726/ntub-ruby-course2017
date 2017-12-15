class Order
  attr_reader :state , :items 
  
  def initialize (product=[])
    @state = "pending"
    @items=product  
  end
  
  def pay!
    @state = "paid"
  end  
  
  def total_price
    items.reduce(0) { |sum, item| sum + (item[:quantity]*item[:price]) }
  end 

end

