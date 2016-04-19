require "rails_helper"

feature "Guest searches for a Product" do
  scenario "and finds the droids they’re looking for", js: true do
    visit root_path

    fill_in "products_product_name", with: "Sla"

    expect(page).to have_selector("#result-Slack", visible: true)
    expect(page).to have_text("Slack")
  end
end
