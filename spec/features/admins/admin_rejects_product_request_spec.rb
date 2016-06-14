require "rails_helper"

feature "Admin Rejects Product Request" do
  before do
    login_as(admin, scope: :user)
    product_request
  end

  scenario "and no longer sees the Product Request in the Dashboard" do
    visit admin_dashboard_path

    click_on product_request.name

    click_on t("admin.product_requests.edit.reject")

    expect(page).to have_text t("admin.product_requests.destroy.success")
  end

  def admin
    @admin ||= create(:user, admin: true)
  end

  def product_owner
    @product_owner ||= create(:user, type: "ProductOwner")
  end

  def product_request
    @product_request ||=
      create(:product_request, :with_draft, user: product_owner)
  end
end
