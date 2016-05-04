#Author: Kelli Mohr

require 'spec_helper'

describe Receipt do 
	before :each do
		@receipt = Receipt.new :qty, :item, :price, :salesTax, :importTax
	end

	describe "qty" do
		it "Returns the correct quantity" do
			expect(@receipt.qty).to eql :qty
		end
	end

	describe "item" do
		it "Returns the correct item" do
			expect(@receipt.item).to eql :item
		end
	end

	describe "price" do
		it "Returns the correct price" do
			expect(@receipt.price).to eql :price
		end
	end

	describe "salesTax" do
		it "Returns the correct salesTax" do
			expect(@receipt.salesTax).to eql :salesTax
		end
	end

	describe "importTax" do
		it "Returns the correct importTax" do
			expect(@receipt.importTax).to eql :importTax
		end
	end

	describe "calcTotalTax" do
		it "Returns the correct Total Tax" do
			expect(@receipt.calcTotalTax(0.50)).to eql 0.50
		end
	end

	describe "calcTotalPrice" do
		it "Returns the correct Total Price" do
			expect(@receipt.calcTotalPrice(50.50)).to eql 50.50
		end
	end

	describe "printTotalTax" do
		it "Returns nil for PrintTotalTax" do
			expect(@receipt.printTotalTax).to eql 0
		end
	end
	
	describe "printTotalPrice" do
		it "Returns nil for printTotalPrice" do
			expect(@receipt.printTotalPrice).to eql 0
		end
	end
end