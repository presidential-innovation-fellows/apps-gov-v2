require "rails_helper"

feature "Government User destroys account" do
  before { login_as(gov_user, scope: :government_user) }

  context "when a Government User has JS enabled", js: true do
    scenario "they destroy their account from the Edit Account page" do
      visit root_path

      click_on gov_user.name
      click_on t("modules.navigation.edit_account")

      click_on "Cancel my account"

      expect(page).to have_text t("devise.registrations.destroyed")
    end
  end

  def gov_user
    @user ||= create(:user, :as_gov_user)
  end
end
