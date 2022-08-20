class CashRegister
	attr_accessor :discount, :total, :items, :last_transaction

	def initialize (discount=0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title, price, quantity=1)
		self.last_transaction = price * quantity
		self.total += price * quantity
		quantity.times do
			self.items << title
		end
		self.last_transaction = price * quantity
	end

	def apply_discount
		if self.discount != 0
			selling_price_as_percent = (100.0 - self.discount.to_f)/100
			self.total = (self.total * selling_price_as_percent).to_i
			"After the discount, the total comes to $#{self.total}."
		else
			"There is no discount to apply."
		end
	end

	def void_last_transaction
		self.total -= last_transaction
	end

end


test = CashRegister.new
test.add_item("Mango",2,4)
test.add_item("Tomato", 2,4)
puts test.items
