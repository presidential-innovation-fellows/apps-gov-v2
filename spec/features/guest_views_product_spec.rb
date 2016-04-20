require "rails_helper"

feature "Guest views a Product" do
  context "that has no contact information" do
    scenario "and sees a disabled Contact button" do
      visit product_path(product)

      expect(page).to have_css(".usa-button.disabled")
    end
  end

  context "that has contact information" do
    scenario "and sees a Contact button" do
      visit product_path(product_with_sales_poc)

      expect(page).to have_css(".usa-button")
      expect(page).to_not have_css(".disabled")
    end
  end

  def product
    @product ||= create(:product)
  end

  def product_with_sales_poc
    @product_with_sales_poc ||= create(:product, sales_poc: "email@email.com")
  end
end
