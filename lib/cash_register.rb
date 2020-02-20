require 'pry'
class CashRegister
    attr_accessor :discount, :total
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @itemPriceRelation = {}
    end
    def add_item(nameOfItem, price, quantity=1)
        @total += price*quantity
        @itemPriceRelation[nameOfItem] = [price, quantity]
        nameOfItem = nameOfItem + " "
        nameOfItem = nameOfItem.split
        @items << nameOfItem*quantity
        @items = @items.flatten
    end
    def apply_discount
        @total -= @total * (@discount / 100.0)
        if @discount == 0
            p "There is no discount to apply."
        else
            p "After the discount, the total comes to $#{@total.to_i}."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        @lastItem = @items.pop
        print @itemPriceRelation[@lastItem]
        if @items != []
            p @total = @total - @itemPriceRelation[@lastItem][0] * @itemPriceRelation[@lastItem][-1]
        else
            @total = 0
        end
    end
end

