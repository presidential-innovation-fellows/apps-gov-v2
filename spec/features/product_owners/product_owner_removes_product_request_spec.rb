require "rails_helper"

feature "Product Owner Destroys Product Request", js: true do
  before { login_as(product_owner, scope: :product_owner) }

  scenario "by clicking the Remove link in their Dashboard" do
    create(:product_request, product: product, user: product_owner)
    visit dashboard_path

    click_on t("product_owners.dashboard.product_request.delete")

    expect(page).
      to have_text t("product_owners.product_requests.destroy.success")
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end
end
