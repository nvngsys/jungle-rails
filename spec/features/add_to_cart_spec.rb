require 'rails_helper'

RSpec.feature "Add to Carts", type: :feature, js: true do  

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

    scenario "Add to Carts" do
      visit root_path
      save_screenshot('add_to_cart_1.png')
      # I found both of these to work - keep for reference
      #first('article.product footer.actions .button_to').click
      first('article.product footer.actions .button_to').click_on
      save_screenshot('add_to_cart_2.png')

    end
end
