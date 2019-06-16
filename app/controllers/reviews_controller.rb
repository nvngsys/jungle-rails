class ReviewsController < ApplicationController

  def index
    product_id = params['product_id']
    puts "Product _id #{product_id}"
    @product = Product.find(product_id)

    @reviews = @product.reviews
  end

   def create
    puts 'show me params'
    puts params
    puts "show me current user #{current_user.id}"
    
    @product = Product.find(params['product_id'])
    p = @product.reviews.create!(allowed_params)

    redirect_to product_path(@product)
    end

    private
    def allowed_params
      params.require(:review).permit(:user_id, :description, :rating)
    end
   

end
