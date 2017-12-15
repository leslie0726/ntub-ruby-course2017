class Order


  attr_reader :items
  attr_reader :state

  def initialize(products=[])

    @state = "pending"
    @items = products

  end

  def pay!

    @state = "paid"

  end

  def total_price

    return 0 if @items.empty?
    return @items.inject(0){|total, item| total+item_total(item)}

  end

  private
  def item_total(item)

    item[:quantity].to_i*item[:price].to_i
  end

end
