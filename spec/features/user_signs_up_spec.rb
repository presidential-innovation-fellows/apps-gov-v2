require "rails_helper"

feature "A User signs up" do
  scenario "and creates an account" do
    visit new_user_registration_path

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "email@email.gov"
    fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact

    click_on "Sign up"

    expect(page).
      to have_text t("devise.registrations.signed_up")
  end
end
