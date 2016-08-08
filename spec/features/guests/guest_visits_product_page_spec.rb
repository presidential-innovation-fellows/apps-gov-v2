require "rails_helper"

feature "Guest visits Product page" do
  before { visit product_path(product) }

  scenario "and sees a Product’s ATO Statuses" do
    expect(page).to have_css(".checked", text: product.ato_types.first.name)
  end

  scenario "and sees a Product’s Procurement Options" do
    expect(page).
      to have_css(".product-contracts", text: product.contracts.first.name)
  end

  def product
    @product ||= create(:product, :with_ato_type, :with_contract)
  end
end
