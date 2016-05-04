#Author: Kelli Mohr

require 'spec_helper'

describe Receipt do 
	before :each do
		@receipt = Receipt.new :qty, :item, :price, :salesTax, :importTax
	end

	describe "qty" do
		it "Returns the correct quantity" do
			@receipt.qty.should eql :qty
		end
	end

	describe "item" do
		it "Returns the correct item" do
			@receipt.item.should eql :item
		end
	end

	describe "price" do
		it "Returns the correct price" do
			@receipt.price.should eql :price
		end
	end

	describe "salesTax" do
		it "Returns the correct salesTax" do
			@receipt.salesTax.should eql :salesTax
		end
	end

	describe "importTax" do
		it "Returns the correct importTax" do
			@receipt.importTax.should eql :importTax
		end
	end

	describe "calcTotalTax" do
		it "Returns the correct Total Tax" do
			@receipt.calcTotalTax(0.50).should eql 0.50
		end
	end

	describe "calcTotalPrice" do
		it "Returns the correct Total Price" do
			@receipt.calcTotalPrice(50.50).should eql 50.50
		end
	end

	describe "printTotalTax" do
		it "Returns nil for PrintTotalTax" do
			@receipt.printTotalTax.should eql 0
		end
	end
	
	describe "printTotalPrice" do
		it "Returns nil for printTotalPrice" do
			@receipt.printTotalPrice.should eql 0
		end
	end
end