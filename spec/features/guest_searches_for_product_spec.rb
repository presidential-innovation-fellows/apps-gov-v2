require "rails_helper"

feature "Guest searches for a Product" do

  context "with an empty query" do
    scenario "and sees an error" do
      visit products_search_path

      expect(page).to have_text t("products.search.failure")
      expect(page).to_not have_current_path(products_search_path)
    end
  end

  context "with JavaScript enabled", js: true do
    scenario "and cannot submit the form" do
      visit root_path

      click_on t("products.index.search_products")

      expect(page).to have_current_path(root_path)
    end

    scenario "and sees their search in autocomplete" do
      visit root_path

      fill_in "products_name", with: "Sla"

      expect(page).to have_selector("#result-#{product.slug}", visible: true)
      expect(page).to have_text product.name
    end

    scenario "and uses autocomplete to view the Product’s page" do
      visit root_path

      fill_in "products_name", with: product.name
      within("#result-#{product.slug}") do
        first("a").click
      end

      expect(page).to have_link product.name
      expect(page).to have_text product.long_description
    end
  end

  scenario "and submits the search form" do
    visit root_path

    fill_in "products_name", with: product.name
    click_on t("products.index.search_products")

    expect(page).to have_text t("products.search.header")
    expect(page).to have_link product.name
    expect(page).to have_text product.short_description
  end

  def product
    @product ||= create(:product, name: "Slack")
  end
end
