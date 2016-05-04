#Author: Kelli Mohr

require_relative 'checkout.rb'

print "\n"
puts 'INPUT'
print "\n"

#Print inputs for the INPUT section
def print_input(input_array)
	input_array.each { |item| puts item }
end

#Prep inputs be processed for taxes and totals
def add_to_cart(input_array)
    @input = []
    i = 0
    input_array.each do |item| 
        
	    @input.push( {
			:qty 	=> item.chars.first.to_i,
			:item 	=> item.split(/ at/).first,
			:price 	=> item.split(/ at/)[-1].to_f,
			:imported => item =~ /imported/ ? true : false
		})
	end
    
end

#Inputs to be computed and printed to receipts
input_array1 = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
input_array2 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
input_array3 = ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", 
	            "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]

puts 'Input 1:'
print_input(input_array1)
print "\n"
add_to_cart(input_array1)
input1 = {
	'Line1' => @input[0],
	'Line2' => @input[1],
	'Line3' => @input[2]
}

puts 'Input 2:'
print_input(input_array2)
print "\n"
add_to_cart(input_array2)
input2 = {
	'Line1' => @input[0],
	'Line2' => @input[1]
	
}

puts 'Input 3:'
print_input(input_array3)
print "\n"
add_to_cart(input_array3)
input3 = {
	'Line1' => @input[0],
	'Line2' => @input[1],
	'Line3' => @input[2],
	'Line4' => @input[3]
}

#Start processing the output printing
puts 'OUTPUT'
print "\n"

puts 'Output 1:'
cart1 = Checkout.new(input1)
cart1.getReceipt(input1)
puts ' '

print "\n"
puts 'Output 2:'
cart2 = Checkout.new(input2)
cart2.getReceipt(input2)
puts ' '

print "\n"
puts 'Output 3:'
cart3 = Checkout.new(input3)
cart3.getReceipt(input3)
print "\n"
