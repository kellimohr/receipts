#Author: Kelli Mohr

class Receipt

	attr_accessor :qty, :item, :price, :salesTax, :importTax
	@@totalTax = 0
	@@totalPrice = 0


	def initialize(qty, item, price, salesTax, importTax)

		@qty = qty
		@item = item
		@price = price
		@salesTax = salesTax
		@importTax = importTax

 	end

 	#Print details of items on receipt
 	def printItem

 		tax = salesTax + importTax
 		newPrice = price + tax
		
		calcTotalTax(tax)
		calcTotalPrice(newPrice)

		newPrice = sprintf('%.2f', newPrice)

		puts item + ': ' + newPrice
 	end

 	#Calculate the tax running total
 	def calcTotalTax(tax)
 		@@totalTax = @@totalTax + tax
 	end

 	#Print the Sales Tax total
 	def printTotalTax
 		totalTax = sprintf('%.2f', @@totalTax)
 		print "Sales Taxes: " + totalTax
 		@@totalTax = 0
 	end

 	#Calculate the price running total
 	def calcTotalPrice(newPrice)
 		@@totalPrice = @@totalPrice + newPrice
 	end

 	#Print the Price Total for the receipt
 	def printTotalPrice
 		totalPrice = sprintf('%.2f', @@totalPrice)
 		print "Total: " + totalPrice
 		@@totalPrice = 0
 	end
end