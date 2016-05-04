#Author: Kelli Mohr

require 'spec_helper'

describe Checkout do
	
	before :each do
		
		cart = {
			'Line1' => {
				:qty 	=> 1,
				:item 	=> 'Computer',
				:price 	=> 1000.53,
				:imported => false
			}
		}

		@checkout = Checkout.new(cart)
	end

	describe "Checkout Input" do
		it "Returns a value of nil" do
			@checkout.input.should be_nil
		end
	end
end
