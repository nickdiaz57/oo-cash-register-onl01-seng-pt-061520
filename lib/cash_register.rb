class CashRegister
    attr_accessor :total, :discount, :prev_total, :items
    
    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    def add_item(item, price, quantity = 1)
        @prev_total = @total
        @total = @total + (price*quantity)
        i = 0
        while i < quantity
            @items << item
            i += 1
        end
    end

    def apply_discount
        if @discount == nil
            return "There is no discount to apply."
        else
            @total = @total.to_f - ((@discount.to_f / 100.0) * @total.to_f)
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total = @prev_total
    end
    
end