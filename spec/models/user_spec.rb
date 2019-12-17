require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with a password and password_confirmation' do
      @user = User.create(:password => "password", :password_confirmation => "password")
      @user.password == @user.password_confirmation
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
      expect(@user.password == @user.password_confirmation).to be true
    end
    it 'should have the password and password_confirmation be identical' do
      @user = User.create(:password => "password", :password_confirmation => "passwordddd")
      @user.password == @user.password_confirmation
      expect(@user.password != @user.password_confirmation).to be true
    end
    it 'should have a password with 6 characters or longer' do
      @user = User.create(:password => "password", :password_confirmation => "password")
      @user.password.length >= 6
      expect(@user.password.length).to be > 5
    end
    it 'should include an email, first_name and last_name' do
      @user = User.create(:email => 'nhoszko@gmail.com', :first_name => 'Nick', :last_name => 'Hoszko', :password_digest => "something")
      expect(@user).to be_valid
    end
    it 'should not be case sensitive with email' do
      @user = User.create(:email => 'nhoszko@gmail.com', :first_name => 'Nick', :last_name => 'Hoszko', :password_digest => "something")
    end
  end

  
  describe '.authenticate_with_credentials' do

  end
end
