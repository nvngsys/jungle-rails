module ApplicationHelper
end

def empty_cart
 !!enhanced_cart.first?
end
