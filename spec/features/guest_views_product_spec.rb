require "rails_helper"

feature "Guest views a Product" do
  scenario "and creates an account", js: true do
    agency = create(:agency)

    visit product_path(product)

    click_on t("products.product_sidebar.get_product")

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "email@email.gov"
    fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact
    select agency.name, from: "Agency"

    click_on "Sign up"

    expect(page).to have_text "You’re all set!"
  end

  def product
    @product ||= create(:product)
  end

  def product_with_sales_poc
    @product_with_sales_poc ||= create(:product, sales_poc: "email@email.com")
  end
end
