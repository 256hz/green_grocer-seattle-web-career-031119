require 'pry'

def consolidate_cart(cart)
  puts "starting cart:\n#{cart}"
  merged_cart = {}
  cart.each_with_index do |item, index|
    puts "cart[#{index}]"
    item_name = item.keys[0]
    puts "processing #{item_name}"
    if merged_cart != {}
      puts "merged_cart not empty"
      puts "#{merged_cart.keys}"
      if merged_cart.keys.include?(item_name) == false
        merged_cart[item_name] = item.values 
        puts "#{item} not found in merged_cart, added"
        merged_cart[-1][item_name][:count] = 1
      else
        mc_index = merged_cart.index{|i| i.keys[0] == item_name}
        merged_cart[mc_index][item_name][:count] += 1
        puts "duplicate item found, count = #{merged_cart[mc_index][item_name][:count]}"
      end
    else #add item if empty cart
      puts "cart was empty"
      merged_cart << item
      merged_cart[-1][item_name][:count] = 1
      puts "merged_cart:\n#{merged_cart}\n"
    end
    puts merged_cart + "\n"
  end

  merged_cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
