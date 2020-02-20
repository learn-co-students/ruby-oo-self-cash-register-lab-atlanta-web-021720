
class CashRegister

    attr_reader :discount, :items
    attr_accessor :total

    def initialize(employee=nil)
        @total = 0.0
        @discount = employee
        @items = []
        @price_array = []
        @last_transaction_items = []
        @last_transaction_prices = []
    end

    def add_item(title, price, qty=1)
        @total += (price * qty)
        qty.times do
            @items << title
        end
        @last_transaction_items << title
        @last_transaction_prices << price * qty
    end

    def apply_discount
        if @discount
            @discount = @discount.to_f * 0.01
            @total -= (@total * @discount)

            if @total == @total.to_i
                zero_free_total = @total.to_i
            else
                zero_free_total = @total
            end
            "After the discount, the total comes to $#{zero_free_total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @last_transaction_items.pop()
        @total -= @last_transaction_prices.pop()
    end

end