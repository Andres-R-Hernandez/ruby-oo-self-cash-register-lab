class CashRegister

  attr_accessor :total, :discount, :items, :item_prices

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @item_prices = []
  end

  def add_item(title, price, quantity=1)
    quantity.times {@items << title}
    @total += price * quantity
    @item_prices << price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -=  @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @items
    @total -= @item_prices[-1]
    self.item_prices.pop
    @total
  end

end
