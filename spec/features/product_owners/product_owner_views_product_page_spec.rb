require "rails_helper"

feature "Product Owner views Product page" do
  context "with an account" do
    before { login_as(product_owner, scope: :product_owner) }
    scenario "and creates a Product Request" do
      visit product_path(product)

      click_on "Edit"

      expect(page).
        to have_text t("product_owners.product_requests.create.success")
    end
  end

  context "without an account" do
    context "while JavaScript is enabled", js: true do
      scenario "and creates an account" do
        visit product_path(product)

        click_on "Edit"

        fill_in "First name", with: "John"
        fill_in "Last name", with: "Doe"
        fill_in "Email", with: "email@email.com"
        fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact

        click_on "Sign up"

        expect(page).
          to have_text t("devise.registrations.signed_up")
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
          to have_text t("devise.registrations.signed_up")
      end
    end
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end
end
