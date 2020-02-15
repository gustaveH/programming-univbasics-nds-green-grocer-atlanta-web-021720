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





end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
