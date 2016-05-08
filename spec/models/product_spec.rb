require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_no_name) { Product.new(description: 'hello') }
  let(:product_no_description) { Product.new(name: 'yep') }
  let(:product) { Product.new(name: 'everything is great', description: "it's true", price: 10.00, quantity: 1)}
  # blog_no_name = Product.new(description: 'hello')
  describe 'validations' do
    context 'will raise an error ' do
      it 'when the name field is empty' do
        product_no_name.save
        expect(product_no_name.errors[:name]).to include("can't be blank")
      end
      it 'when the description field is empty' do
        product_no_description.save
        expect(product_no_description.errors[:description]).to include("can't be blank")
      end
    end
    it 'saves the Product when the fields are not blank' do
      expect{product.save}.to change{Product.count}.by(1)
    end
  end
end
