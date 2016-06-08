require "rails_helper"

feature "Admin Publishes Product Draft" do
  before { login_as(admin, scope: :user) }

  scenario "and the draft is no longer visible in the Dashboard" do
    product = create(:product, :with_draft)

    visit dashboard_path
    click_on product.name

    click_on t("admin.products.edit.submit")

    expect(page).to have_text t("admin.products.update.success")
    expect(page).not_to have_text product.name
  end

  def admin
    @admin ||= create(:user, admin: true)
  end
end
