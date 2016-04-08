require "rails_helper"

feature "User Sign Up" do
  scenario "a User creates an account" do
    visit new_user_registration_path

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact
    fill_in "Password confirmation", with: "12345sixsevenEight"

    click_on "Sign up"

    expect(page).to have_text t("devise.registrations.signed_up")
  end
end
