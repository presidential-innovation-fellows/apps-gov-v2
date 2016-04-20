require "rails_helper"

feature "Guest searches for a Product" do
  scenario "and finds the droids they’re looking for", js: true do
    visit root_path

    fill_in "products_product_name", with: "Sla"

    expect(page).to have_selector("#result-#{product.slug}", visible: true)
    expect(page).to have_text product.name
  end

  scenario "and views the Product’s page", js: true do
    visit root_path

    fill_in "products_product_name", with: product.name
    within("#result-#{product.slug}") do
      first("a").click
    end

    expect(page).to have_link product.name
    expect(page).to have_text product.long_description
  end

  def product
    @product ||= create(:product, name: "Slack")
  end
end
