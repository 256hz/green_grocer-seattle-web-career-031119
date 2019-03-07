require_relative 'grocer'
require 'pry'

class Hash
  def include_hash?(hash)
    merge(hash) == self
  end
end

def items
	[
		{"AVOCADO" => {:price => 3.00, :clearance => true}},
		{"KALE" => {:price => 3.00, :clearance => false}},
		{"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
		{"ALMONDS" => {:price => 9.00, :clearance => false}},
		{"TEMPEH" => {:price => 3.00, :clearance => true}},
		{"CHEESE" => {:price => 6.50, :clearance => false}},
		{"BEER" => {:price => 13.00, :clearance => false}},
		{"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
		{"BEETS" => {:price => 2.50, :clearance => false}}
	]
end

def coupons
	[
		{:item => "AVOCADO", :num => 2, :cost => 5.00},
		{:item => "BEER", :num => 2, :cost => 20.00},
		{:item => "CHEESE", :num => 3, :cost => 15.00}
	]
end

def generate_cart
	[].tap do |cart|
		rand(20).times do
			cart.push(items.sample)
		end
	end
end

def generate_coupons
	[].tap do |c|
		rand(2).times do
			c.push(coupons.sample)
		end
	end
end

cart = generate_cart
coupons = generate_coupons

puts "Items in cart"
cart.each do |item|
	puts "Item: #{item.keys.first}"
	puts "Price: #{item[item.keys.first][:price]}"
	puts "Clearance: #{item[item.keys.first][:clearance]}"
	puts "=" * 10
end

puts "Coupons on hand"
coupons.each do |coupon|
	puts "Get #{coupon[:item].capitalize} for #{coupon[:cost]} when you by #{coupon[:num]}"
end

#binding.pry

def consolidate_cart(cart)
  combined_cart = []
  cart.each.with_index do |item, index|
    binding.pry
    items_in_cart = []
    combined_cart.each{|i| items_in_cart << i.keys[0]}
    end
    if combined_cart == [] || combined_cart[0].include_hash?(item) == false
      combined_cart.push(cart[index])
      item_name = item.keys[0]
      combined_cart[-1][item_name][:count] = 1
    else
      combined_cart.each.with_index do |comb_item, comb_index|
        if item == comb_item
          combined_cart[comb_index][item.keys][:count] += 1
        end
      end
    end
  end
  puts combined_cart
  combined_cart
end

consolidate_cart(cart)
  
puts "Your total is #{checkout(cart: cart, coupons: coupons)}"