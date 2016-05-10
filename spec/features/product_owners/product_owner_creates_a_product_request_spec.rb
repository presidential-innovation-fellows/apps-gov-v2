require "rails_helper"

feature "Product Owner Creates Product Request" do
  before { login_as(product_owner, scope: :product_owner) }

  scenario "by clicking the Edit button" do
    visit product_path(product)

    click_on "Edit"

    expect(page).
      to have_text t("product_owners.product_requests.create.success")
    expect(page).
      to have_text t("product_owners.dashboard.index.heading")
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end
end
