#Author: Kelli Mohr

require 'spec_helper'

describe Tax do 

	before :each do
		calculateTax = {
		:qty 	=> 1,
		:item 	=> 'Gun',
		:price 	=> 150.00,
		:imported => true
		}
		@tax = Tax.new(calculateTax)
	end

	it "should have 1 in the qty key" do
		@tax.qty.should eql 1
	end

	it "should have Gun in the item key" do
		@tax.item.should eql 'Gun'
	end

	it "should have 150.00 in the price key" do
		@tax.price.should eql 150.00
	end

	it "should have true in the imported key" do
		@tax.imported.should be_true
	end

	it "should not be tax exempt" do
		@tax.taxExempt(@tax.item).should be_false
	end

	it "should have rounded tax of 10% = 15.00" do
		@tax.calcTax(10).should eql 15.00
	end

	it "should have sales tax of 15.00" do
		@tax.addSalesTax(@tax.item, @tax.price).should eql 15.00
	end

	it "should have imported tax of 7.5" do
		@tax.addImportTax(@tax.imported).should eql 7.5
	end

	it "should not be food item" do
		@tax.food(@tax.item).should be_false
	end

	it "should not be medical product item" do
		@tax.medicalProduct(@tax.item).should be_false
	end	

end