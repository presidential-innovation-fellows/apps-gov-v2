require "rails_helper"

feature "Product Owner Views Dashboard" do
  before { login_as(product_owner, scope: :product_owner) }

  context "when no Product Requests have been created" do
    scenario "and is asked to search for their Product" do
      visit product_owner_dashboard_path

      expect(page).
        to have_text t("#{translation_path}.no_requests")
      expect(page).
        to have_link t("#{translation_path}.request_product"), root_path
    end
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end

  def translation_path
    "product_owners.dashboard.product_requests"
  end
end
