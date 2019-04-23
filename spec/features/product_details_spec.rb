require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |m|
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
    product = @category.products.find(1)

    # ACT
    visit "/"
    page.find('article:first-child .btn-default').click

    # DEBUG / VERIFY ON THE PRODUCT PAGE
    expect(page).to have_css('.products-show .page-header h1')
    title = page.find('.products-show .page-header h1')
    expect(title.text).to include(product.name)
  end

end