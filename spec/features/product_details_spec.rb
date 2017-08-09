require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    
    # 10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
    # end
  end

  scenario "They want to navigate to a product detail page" do
    visit '/'

    first('article.product').find_link('Details').click
    sleep(3) #this just makes the screenshot take 3 seconds longer

    expect(page).to have_css('section.products-show')

  end

end
