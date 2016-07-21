require "rails_helper"

feature "A Government User signs up" do
  context "with a government email address" do
    scenario "and creates an account" do
      agency = create(:agency)

      visit new_government_user_registration_path

      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "email@email.gov"
      fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact
      select(agency.name, from: "Agency")
      fill_in "Team Name (your team within your agency)", with: "Team Name"

      click_on "Sign up"

      expect(page).
        to have_text t("devise.registrations.signed_up")
    end
  end

  context "without a government email address" do
    scenario "and fails to create an account" do
      agency = create(:agency)

      visit new_government_user_registration_path

      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "12345sixsevenEight", match: :prefer_exact
      select(agency.name, from: "Agency")

      click_on "Sign up"

      expect(page).
        to have_text t("government_users.failures.no_gov_email")
    end
  end
end
