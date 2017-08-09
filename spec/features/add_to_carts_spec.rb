require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
      # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

  end

  scenario "They want to add a product to their cart" do 
    visit root_path
    first('article.product').find_link('Add').click
    sleep(3)
    save_screenshot
    expect(page).to have_css('.cart', text: "My Cart (1)")
    
  end

end
