require_relative "./order.rb"
RSpec.describe Order do
  describe "訂單管理" do
    it "一開始新增的訂單狀態是 pending（未處理）" do
      order = Order.new

      expect(order.state).to eq "pending"
    end

    it "付款後狀態變成已 paid（已付款）" do
      order = Order.new
      order.pay!   # 進行付款

      expect(order.state).to eq "paid"
    end
  end

  describe "訂單功能" do
    it "計算訂單金額" do
      order = Order.new(products)

      expect(order.items.count).to be 3    # 共有 3 項商品
      expect(order.total_price).to be 155  # 總計 155 元
    end
  end

  private
  def products
    [
      {product: "鉛筆", quantity: 2, price: 20},
      {product: "書", quantity: 1, price: 100},
      {product: "美工刀", quantity: 1, price: 15},
    ]
  end
end