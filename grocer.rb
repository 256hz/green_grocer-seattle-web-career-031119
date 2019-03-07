require 'pry'

def consolidate_cart(cart)
  cart.each{|c| puts c}
  merged_cart = {}
  cart.each do |item|
    item_name = item.keys[0]
#    puts "processing #{item_name}"
#    puts item
#    puts "cart.size = #{cart.size}"
#    puts "merged_cart.size = #{merged_cart.size}"
    if merged_cart.size > 0                               #if items in cart, check for duplicate
#      puts "merged_cart not empty"
#      puts "#{merged_cart.keys}"
      if merged_cart.keys.include?(item_name) == false    #new item's name not found in merged items
        merged_cart[item_name] = {price: item[item_name][:price], clearance: item[item_name][:clearance], count: 1}
#        puts "#{item} not found in merged_cart, added"
      else                                                #new item's name found
        merged_cart[item_name][:count] += 1
#        puts "duplicate item found, count = #{merged_cart[item_name][:count]}"
      end
    else #add item if empty cart
#      puts "cart was empty"
      merged_cart[item_name] = {price: item[item_name][:price], clearance: item[item_name][:clearance], count: 1}
#      puts "merged_cart:\n#{merged_cart}\n"
    end
#    puts merged_cart + "\n"
#    puts "it should loop now\n"
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
