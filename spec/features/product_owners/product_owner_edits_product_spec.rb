require "rails_helper"

feature "Product Owner Edits Product" do
  before { login_as(product_owner, scope: :product_owner) }

  scenario "and sees their draft in their Dashboard" do
    visit dashboard_path

    click_on product_owner.products.first.name

    fill_in "Name", with: "New Product Name"

    click_on "Update Product"

    expect(page).to have_text t("#{translation_path}.in_review")
    expect(product_owner.products.first.draft).to be_truthy
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner, :with_approved_product)
  end

  def translation_path
    "product_owners.dashboard.approved_product_request"
  end
end
