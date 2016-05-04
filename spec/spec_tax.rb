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
		expect(@tax.qty).to eql 1
	end

	it "should have Gun in the item key" do
		expect(@tax.item).to eql 'Gun'
	end

	it "should have 150.00 in the price key" do
		expect(@tax.price).to eql 150.00
	end

	it "should have true in the imported key" do
		expect(@tax.imported).to be true
	end

	it "should not be tax exempt" do
		expect(@tax.taxExempt(@tax.item)).to be false
	end

	it "should have rounded tax of 10% = 15.00" do
		expect(@tax.calcTax(10)).to eql 15.00
	end

	it "should have sales tax of 15.00" do
		expect(@tax.addSalesTax(@tax.item, @tax.price)).to eql 15.00
	end

	it "should have imported tax of 7.5" do
		expect(@tax.addImportTax(@tax.imported)).to eql 7.5
	end

	it "should not be food item" do
		expect(@tax.food(@tax.item)).to be false
	end

	it "should not be medical product item" do
		expect(@tax.medicalProduct(@tax.item)).to be false
	end	

end