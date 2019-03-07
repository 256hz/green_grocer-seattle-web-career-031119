require 'pry'

def consolidate_cart(cart)
  cart.each{|c| puts c}
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
      cart["${coupon[:item]} W/COUPON"] = {price: coupon[:price], clearance: cart[item_name][:clearance], count: 1}
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
