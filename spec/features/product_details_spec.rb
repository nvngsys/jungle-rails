require 'rails_helper'

#RSpec.feature "ProductDetails", type: :feature do
RSpec.feature "Visitor navigates to ProductDetails", type: :feature, js: true do  

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "Starting products" do
    #Visit root path and then select a product
    visit root_path
    
    # Testing click_link
    #click_link('Human Feet Shoes')

    #click_on('btn btn-default pull-right')  this is a buttom on the page below the link - not what I wanted
  
    # Works from here down
    first('article.product header a').click
    visit current_url
    save_screenshot('productdetails.png')
  end
end
