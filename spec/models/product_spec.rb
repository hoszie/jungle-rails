require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'returns true if product includes a name, price, quantity and category_id' do
      @category = Category.create(:name => 'categoryy')
      @product = Product.create(:name => 'Name', :price => 50, :quantity => 3, :category => @category)
      expect(@product).to be_valid
    end
    it 'returns true if product does not include a name' do
      @category = Category.create(:name => 'categoryy')
      @product = Product.create(:name => nil, :price => 50, :quantity => 3, :category => @category)
      expect(@product.name).to be_nil
    end
    it 'returns true if product does not include a price' do
      @category = Category.create(:name => 'categoryy')
      @product = Product.create(:name => 'Name', :price => nil, :quantity => 3, :category => @category)
      expect(@product.price).to be_nil
    end
    it 'returns true if product does not include a quantity' do
      @category = Category.create(:name => 'categoryy')
      @product = Product.create(:name => 'Name', :price => 50, :quantity => nil, :category => @category)
      expect(@product.quantity).to be_nil
    end
    it 'returns true if product does not include a category' do
      @product = Product.create(:name => 'Name', :price => 50, :quantity => 3, :category => nil)
      expect(@product.category).to be_nil
    end
  end
end
