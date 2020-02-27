require 'pry'
class CashRegister
attr_accessor :total, :item, :last_item
attr_reader :discount



def initialize(discount = 0)
    @total = 0
    @item = []
    @discount = discount
    
    
end

def add_item (item, item_price, quantity = 1)
    # @item_price = item_price
    # @quantity = quantity
    self.total += (item_price * quantity)
    quantity.times do
        @item << item 
    end
    self.last_item = item_price * quantity
    #@total += (item_price * quantity) 
end

def apply_discount
    @total = total - ((total * discount)/100)
    if discount > 0 
    "After the discount, the total comes to $#{@total}."

    else 
    "There is no discount to apply."
    end

    
end

def items

    @item    
end

def void_last_transaction
    self.total = self.total - self.last_item
end


end
