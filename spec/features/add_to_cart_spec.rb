require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |m|
      @category.products.create!(
        name: Faker::Hipster.sentence(1),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on the details button" do
    #SELECT PRODUCT
    product = @category.products.all

    # ACT
    visit "/"
    cart_badge = page.find('.navbar-right li:nth-child(4)')

    # DEBUG / VERIFY CART INCREMENT UPON CLICKING ADD
    expect(cart_badge.text).to include('0')
    page.find('article:first-child .btn-primary').click
    expect(cart_badge.text).to include('1')
  end

end