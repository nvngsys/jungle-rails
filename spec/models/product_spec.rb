require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should be able to create' do #
      category = Category.create name: 'Golf1'
      product = Product.create name: 'New product', price: 4000, quantity: 10, category_id: category.id
      expect(product).to be_valid
    end
  
    it 'should not be able to create if name is missing' do #
      category = Category.create name: 'Golf2'
      product = Product.create price: 4000, quantity: 12, category_id: category.id
      expect(product).to_not be_valid
    end

    it 'should not be able to create if price is missing' do #
      category = Category.create name: 'Golf3'
      product = Product.create name: 'New product', quantity: 10, category_id: category.id
      expect(product).to_not be_valid
    end

    it 'should not be able to create if quantity is missing' do #
      category = Category.create name: 'Golf4'
      product = Product.create name: 'New product', price: 4000, category_id: category.id
      expect(product).to_not be_valid
    end

    it 'should not be able to create if quantity is missing' do #
      category = Category.create name: 'Golf4'
      product = Product.create name: 'New product', price: 4000, quantity: 10
      #product.errors.full_messages
      expect(product).to be_valid
    end
  end
end
