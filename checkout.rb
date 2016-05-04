#Author: Kelli Mohr

require_relative 'tax.rb'
require_relative 'receipt.rb'

class Checkout

	attr_accessor :input

	def initialize (cart)
		@receipt = cart[:input]
	end

	#Generate a receipt for the cart
	def getReceipt(receipt)

		#Loop through the items in the cart
		receipt.each{ |key, value|
			
			#Calculate Sales Taxes if applicable
			receipt = Tax.new(value)
			salesTax = receipt.addSalesTax(receipt.item, receipt.price)
			importTax = receipt.addImportTax(receipt.imported)

			#Request a receipt print out
			@output = Receipt.new(receipt.qty, receipt.item, receipt.price,
			                      salesTax, importTax)
			@output.printItem	
		}

		#Print out receipt totals for Sales Tax and Total
		print "\n"
		@output.printTotalTax.to_s 
		print " "
		@output.printTotalPrice.to_s

	end 

end