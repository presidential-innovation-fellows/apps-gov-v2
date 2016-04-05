require "rails_helper"

feature "Guest Visits Homepage" do
  scenario "a Guest clicks the primary call to action button" do
    visit root_path

    click_on t("pages.home.banner_button")

    expect(page).to have_text(t("products.index.header"))
  end
end
