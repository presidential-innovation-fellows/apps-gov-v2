require "rails_helper"

feature "Product Owner creates an Account" do
  context "while JavaScript is enabled", js: true do
    scenario "and creates an account" do
      visit product_path(product)

      click_on "Edit"

      within(".product-owner-modal") do
        fill_in "First name", with: "John"
        fill_in "Last name", with: "Doe"
        fill_in "Email", with: "email@email.com"
        fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact

        click_on "Sign up"
      end

      expect(page).
        to have_text t("modules.navigation.dashboard")
    end
  end

  context "while JavaScript is disabled" do
    scenario "and creates an account" do
      visit product_path(product)

      click_on "Edit"

      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact

      click_on "Sign up"

      expect(page).
        to have_text t("modules.navigation.dashboard")
    end
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end
end
