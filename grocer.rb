def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
    collection.each do |item_info|
          if item_info[:item] == name
            return item_info
          end 
        end
    nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
    new_cart = []
    cart.each do |cart_item|
      item_name = cart_item[:item]
      
    item_info = find_item_by_name_in_collection(item_name, new_cart)
        if item_info
          item_info[:count] += 1
        else
          new_cart << {
          :item => item_name,
          :price => cart_item[:price],
          :clearance => cart_item[:clearance],
          :count => 1
          }
        end 
      end
      new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
    coupons.each do |coupon|
    item_info = find_item_by_name_in_collection(coupon[:item], cart)
    item_w_coupon = find_item_by_name_in_collection(coupon[:item]+" W/COUPON", cart)
    if item_w_coupon and item_info[:count] >= coupon[:num]
        	    item_w_coupon[:count] += coupon[:num]
        	    item_info[:count] -= coupon[:num]
        		elsif item_info and item_info[:count] >= coupon[:num]

      cart << {
        :item => coupon[:item] + " W/COUPON",
        :price => (coupon[:cost]/coupon[:num]).round(2
        :clearance => item_info[:clearance
        :count => coupon[:num]
      }
      
   item_info[:count] -= coupon[:num]
  end 
 end 
 cart 
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
    cart.each do |item_info|
        if item_info[:clearance]
          item_info[:price] *= 0.8
        end 
      end
      cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
    consol_cart = consolidate_cart
    cart_w_coupons_applied = apply_coupons(consol_cart, coupons)
    final_cart = apply_clearance(cart_w_coupons_applied)



end
