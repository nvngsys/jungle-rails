class ReviewsController < ApplicationController

  def index
    product_id = params['product_id']
    puts "Product _id #{product_id}"
    @product = Product.find(product_id)

    @reviews = @product.reviews
  end
end
