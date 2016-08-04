require "rails_helper"

feature "Guest visits Product page" do
  scenario "and sees a Product’s ATO Statuses" do
    visit product_path(product)

    expect(page).to have_css(".checked", text: product.ato_types.first.name)
  end

  def product
    @product ||= create(:product, :with_ato_type)
  end
end