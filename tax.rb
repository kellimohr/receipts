#Author: Kelli Mohr

class Tax

	attr_accessor :line, :salesTax, :importTax, :qty, :item, :price,
				  :imported

	def initialize (calculateTax) 
		
		@qty = calculateTax[:qty]
		@item = calculateTax[:item]
		@price = calculateTax[:price]
		@imported = calculateTax[:imported]
		@salesTax = 10	
		@importTax = 5
	end

	#Determine if item is Tax Exempt
	def taxExempt(item)
		
		isFood = food(item)
		isMedPrd = medicalProduct(item)

		if (isFood == true || isMedPrd == true || item =~ /book/)
			return true
		end
		
		return false 	
	end

	#Tax calculation method for reusability and rounding
	def calcTax(tax_percent)

		tax = (tax_percent * price)/100
		
		roundedTax = (tax * 20).ceil / 20.0

		return roundedTax

	end

	#Calculate item Sales Tax
	def addSalesTax(item, price)

		if taxExempt(item) == true
			return 0.00
		end
		
		tax = calcTax(salesTax)
		
		return tax	
	end

	#Calculate item import tax
	def addImportTax(imported)
		if imported == false
			return 0.00
		end

		impTax = calcTax(importTax)

		return impTax 
	end

	#Define exempt Food items
	def food(item)

		if item =~ /chocolate/
			return true
		end

		return false
	end

	#Define exempt Medical Products
	def medicalProduct(item)

		if item =~ /pills/
			return true
		end

		return false
	end
end
