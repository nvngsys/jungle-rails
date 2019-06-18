require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should be able to create a user' do #    
      user = User.create first_name: 'Jordon', last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      expect(user).to be_valid
    end

    it 'should not be able to create a user if password and password confirmation are not the same' do #    
      user = User.create first_name: 'Jordon',last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxx', password_confirmation: 'xxxxxxxx'
      expect(user).to_not be_valid
    end

    it 'should not be able to create if email already exists in the database' do #
      user = User.create first_name: 'Jordon',last_name: 'Spieth', email: 'fred@flinstone.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      user = User.create first_name: 'Jordon',last_name: 'Spieth', email: 'FRED@flinstone.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      expect(user).to_not be_valid
    end

    it 'should not be able to create if first name does not exist' do #
      user = User.create last_name: 'Spieth', email: 'FRED@flinstone.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      expect(user).to_not be_valid
    end

    it 'should not be able to create if last name does not exist' do #
      user = User.create first_name: 'Jordon', email: 'FRED@flinstone.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      expect(user).to_not be_valid
    end

    it 'should not be able to create if password is less than 8 characters' do #
      user = User.create first_name: 'Jordon', email: 'FRED@flinstone.com', password: 'xxx', password_confirmation: 'xxxxxxxx'
      expect(user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do
    before :all do
      user = User.create first_name: 'Jordon', last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
    end
    it 'user should log in if valid email and password provided' do #
      user = User.create first_name: 'Jordon', last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      user = User.authenticate_with_credentials 'js@spieth.com', 'xxxxxxxx'
      expect(user).to_not be_nil
    end
    
    it 'user should log in if valid email and password provided' do #
      user = User.create first_name: 'Jordon', last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      user = User.authenticate_with_credentials 'js@spieth.com  ', 'xxxxxxxx'
      expect(user).to_not be_nil
    end

    it 'user should log in if valid email and password provided' do #
      user = User.create first_name: 'Jordon', last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
      user = User.authenticate_with_credentials 'jS@spieth.COM  ', 'xxxxxxxx'
      expect(user).to_not be_nil
    end

    # after :all do
    #   user = User.destroy first_name: 'Jordon', last_name: 'Spieth', email: 'js@spieth.com', password: 'xxxxxxxx', password_confirmation: 'xxxxxxxx'
    # end
  end

end
