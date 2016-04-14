require "rails_helper"

feature "Product Creation" do
  before { login_as(admin, scope: :user) }
  scenario "an Admin creates a Product" do
    visit new_admin_product_path

    fill_in "Name", with: "Product Name"
    fill_in "Url", with: "https://pif.gov"
    attach_file "Logo", image_file
    fill_in "Short description", with: short_description
    fill_in "Long description", with: long_description

    click_on "Create Product"

    expect(page).to have_text t("admin.products.create.success_message")
  end

  def admin
    @admin ||= create(:user, admin: true)
  end

  def image_file
    Rails.root.join("spec", "fixtures", "sample-logo.png")
  end

  def long_description
    "
      Lorem ipsum Non consectetur ut velit sunt eiusmod Ut minim qui consequat.
      Lorem ipsum Incididunt labore nostrud exercitation labore sit laboris
      consectetur Excepteur ut.
    "
  end

  def short_description
    "
      Lorem ipsum Adipisicing proident deserunt laborum minim officia in elit
      tempor dolore.
    "
  end

  def user
    @user ||= create(:user)
  end
end
