require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do 
    @category = Category.create name: "Kitchen Stuff"
  end
  
  describe "#new" do 

    it "should have a name" do
      product_1 = Product.create image: "abc.jpg", price: 123, category: @category, quantity: 2, name: nil
      expect(product_1.errors.messages[:name]).to include("can't be blank")
    end

    it "should have a quantity" do 
      product_2 = Product.create name: "thing", image: "thing.jpg", price: 111, category: @category, quantity: nil
      expect(product_2.errors.messages[:quantity]).to include("can't be blank")
    end

    it "should have a price" do 
      product_3 = Product.create name: "thing", image: "thing.jpb", category: @category, quantity: 3, price: nil
      expect(product_3.errors.messages[:price]).to include("is not a number")
    end 

    it "should have a category" do
      product_4 = Product.create name: "another thing", image: "ok.jpg", quantity: 3, category: nil
      expect(product_4.errors.messages[:category]).to include("can't be blank")
    end

    it "should be valid" do 
      @good_product = Product.create name: "Good thing", price: 10, quantity: 1, category: @category
      expect(@good_product).to be_valid
    end 


    # it { should validate_presence_of(:name) } - shouldamatchers test
  end
  


end