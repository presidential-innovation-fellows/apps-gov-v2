require "rails_helper"

feature "Guest visits Category" do
  scenario "and sees Products belonging to that Category" do
    category = create(:category, :with_products)
    visit root_path

    click_on category.name

    expect(page).to have_text t("categories.show.products")
    expect(page).to have_text(category.name)
    expect(page).to have_text(category.products.first.name)
  end
end
