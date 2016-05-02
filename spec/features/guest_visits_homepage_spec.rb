require "rails_helper"

feature "Guest visits homepage" do
  scenario "and sees the latest Products" do
    create_list(:product, 3, created_at: Time.zone.now - 1.day)
    new_product = create(:product, created_at: Time.zone.now)

    visit root_path
    expect(page).to have_text new_product.name
  end

  scenario "and sees the top Products" do
    create_list(:product, 3)
    popular_product = create(:product, :with_product_request)

    visit root_path

    expect(page).to have_text(popular_product.name)
  end
end
