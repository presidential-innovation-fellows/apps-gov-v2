require "rails_helper"

feature "Product Owner Creates a Product" do
  before { login_as(product_owner, scope: :product_owner) }

  scenario "from the Product Dashboard" do
    visit dashboard_path

    click_on t("product_owners.dashboard.index.create_product")

    fill_in "Name", with: "New Product Name"
    fill_in "Url", with: "newproduct.com"
    fill_in "Short description", with: "New product description."
    click_on "Create Product"

    expect(page).to have_text t("product_owners.products.create.success")
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner, :verified)
  end
end
