require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'creates a valid product when all 4 required fields are filled' do
      @category = Category.new(:name => 'Bushes')
      product = Product.new(:name => 'Test', :price => 10, :quantity => 1, :category => @category)

      expect(product).to be_valid
    end
    it 'does not create a valid product when name is nil' do
      @category = Category.new(:name => 'Bushes')

      product = Product.new(:name => nil, :price => 10, :quantity => 1, :category => @category)
      product.save

      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'does not create a valid product when price is nil' do
      @category = Category.new(:name => 'Bushes')

      product = Product.new(:name => 'Test', :quantity => 1, :category => @category)
      product.save

      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'does not create a valid product when quantity is nil' do
      @category = Category.new(:name => 'Bushes')
      product = Product.new(:name => 'Test', :price => 10, :quantity => nil, :category => @category)
      product.save

      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'does not create a valid product when category is nil' do
      @category = Category.new(:name => 'Bushes')
      product = Product.new(:name => 'Test', :price => 10, :quantity => 1, :category => nil)
      product.save

      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
