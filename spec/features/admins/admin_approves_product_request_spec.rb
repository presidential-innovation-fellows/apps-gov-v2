require "rails_helper"

feature "Admin Approves Product Request" do
  before { login_as(admin, scope: :user) }

  scenario "and no longer sees the Product Request in the Dashboard" do
    product_request =
      create(:product_request, :with_draft, user: product_owner)
    visit admin_dashboard_path

    click_on product_request.name

    click_on t("admin.product_requests.edit.approve")

    expect(page).to have_text t("admin.product_requests.update.success")
  end

  def admin
    @admin ||= create(:user, admin: true)
  end

  def product_owner
    @product_owner ||= create(:user, type: "ProductOwner")
  end
end
