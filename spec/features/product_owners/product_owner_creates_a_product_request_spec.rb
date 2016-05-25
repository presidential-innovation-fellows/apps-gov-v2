require "rails_helper"

feature "Product Owner Creates Product Request" do
  before { login_as(product_owner, scope: :product_owner) }

  context "when the Product has been requested" do
    scenario "and does not see the Request to Edit button" do
      create(:product_request, product: product, user: product_owner)
      visit product_path(product)

      expect(page).to_not have_selector(:link_or_button, "Request to Edit")
      expect(page).to have_text t("products.product_content.requested")
    end
  end

  context "when the Product has not been requested" do
    scenario "by clicking the Edit button" do
      visit product_path(product)

      click_on "Request to Edit"

      expect(page).
        to have_text t("product_owners.product_requests.create.success")
      expect(page).
        to have_text t("product_owners.dashboard.index.heading")
    end
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end
end
