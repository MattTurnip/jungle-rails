require 'rails_helper'

RSpec.describe Product, type: :model do
  test_category = Category.create({name: "Hot Dog Accessories"})
  subject { Product.new(
                        name: 'Hot Dog', 
                        price: 49.95, 
                        quantity: 45,
                        category: test_category
                        )}  
  
  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    
    it 'is not valid without a category' do 
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
    
  end
end
