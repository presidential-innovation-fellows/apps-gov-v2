require "rails_helper"

feature "Government User views a Product" do
  context "with JavaScript enabled", js: true do
    scenario "and creates an account" do
      agency = create(:agency)
      visit product_path(product)

      click_on t("products.product_sidebar.get_product")

      within(".gov-user-sign-up") do
        fill_in "First name", with: "John"
        fill_in "Last name", with: "Doe"
        fill_in "Email", with: "email@email.gov"
        fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact
        select agency.name, from: "Agency"

        click_on "Sign up"
      end

      expect(page).to have_text "You’re all set!"
    end
  end

  scenario "and does not see an Edit button" do
    visit product_path(product)

    expect(page).to_not have_text t("products.product_content.edit_product")
  end

  def product
    @product ||= create(:product)
  end
end
