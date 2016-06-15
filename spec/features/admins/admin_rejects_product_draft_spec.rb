require "rails_helper"

feature "Admin Rejects Product Draft" do
  before { login_as(admin, scope: :user) }

  scenario "and provides a reason for doing so" do
    product = create(:product, :with_draft)

    visit dashboard_path
    click_on product.name

    click_on t("admin.products.edit.reject")

    fill_in t("admin.messages.new.content"), with: "The content is inappropriate."
    click_on t("admin.messages.new.submit")

    expect(page).to have_text t("admin.messages.create.success")
    expect(page).not_to have_text product.name
  end

  def admin
    @admin ||= create(:user, admin: true)
  end
end
