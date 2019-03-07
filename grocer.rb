require 'pry'

def consolidate_cart(cart)
  merged_cart = {}
  cart.each do |item|
    item_name = item.keys[0]
    if merged_cart.size > 0                               #if items in cart, check for duplicate
      if merged_cart.keys.include?(item_name) == false    #new item's name not found in merged items
        merged_cart[item_name] = {price: item[item_name][:price], clearance: item[item_name][:clearance], count: 1}
      else                                                #new item's name found, add to count
        merged_cart[item_name][:count] += 1
      end
    else                                                  #add item if empty cart
      merged_cart[item_name] = {price: item[item_name][:price], clearance: item[item_name][:clearance], count: 1}
    end
  end
  merged_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item_name = coupon[:item]
    if cart.keys.include?(item_name) &&
                coupon[:num] <= cart[item_name][:count]
      cart[item_name][:count] -= coupon[:num]
      if cart["#{item_name} W/COUPON"] == nil
        cart["#{item_name} W/COUPON"] = {price: coupon[:cost], clearance: cart[item_name][:clearance], count: 1}
      else
        cart["#{item_name} W/COUPON"][:count] +=1
      end
    end
  end
  cart
end

def apply_clearance(cart)
  puts cart
  cart.each_with_index do |item, index|
    puts cart[index]
    if cart[index][:clearance] == true
      cart[index][:price] *= 0.8
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
