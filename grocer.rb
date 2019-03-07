require 'pry'

def consolidate_cart(cart)
  merged_cart = []
  cart.each do |item|
    item_name = item.keys[0]
    if merged_cart != []
      merged_cart_items = []
      merged_cart.each {|i| merged_cart_items << i.keys[0]}
      binding.pry
      if merged_cart_items.include?(item_name) == false
        merged_cart << item
        merged_cart[-1][item_name][:count] = 1
      else
        mc_index = merged_cart.index{|i| i.keys[0] == item_name}
        merged_cart[mc_index][item_name][:count] += 1
      end
    else
      merged_cart << item
      merged_cart[-1][item_name][:count] = 1
    end
  end
  #binding.pry
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
