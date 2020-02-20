require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction 
    def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
    end 

    def total
        @total
    end 


    def add_item(item, price, quantity=0)
        if quantity > 0 
            @total = @total + (quantity * price)
            @last_transaction = price * quantity
            counter = 0 
            while counter < quantity do 
                items << item
                counter += 1
            end 
        else
            @total = @total + price
            items << item
            @last_transaction = price 
        end 
        @total 
    end 

    def apply_discount
        if discount > 0 
            discount_as_decimal = (discount.to_f / 100.00) 
            discount_amount = @total * discount_as_decimal
            @total = @total - discount_amount.to_i
            pp "After the discount, the total comes to $#{@total}."
        else 
            pp "There is no discount to apply."
        end 
    end 

    def items 
        @items
    end 

    def void_last_transaction
     @total = @total - @last_transaction
   
    end 
end 