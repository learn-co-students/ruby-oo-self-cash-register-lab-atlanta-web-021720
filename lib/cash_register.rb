require 'pry'

class CashRegister

    attr_accessor :total, :discount, :title, :price
    def initialize(discount=0)
        @total = 0
        @discount ||= discount
        @title = []
        @price = []
    end

    def add_item(title, price, n=0)
        if n > 0
            self.total += price * n
            @title.fill(title, @title.length, n)
            @price << price * n
        else
            self.total += price
            @title << title
            @price << price
        end
    end

    def apply_discount
        if @discount > 0
            @total = @total - (@total * (@discount * 0.01))
             return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @title
    end

    def void_last_transaction
        @total -= @price[-1]
    end
end
