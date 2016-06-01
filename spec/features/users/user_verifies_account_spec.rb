require "rails_helper"

feature "Account Verification" do
  context "when a User has not verified their account" do
    before { login_as(unverified_user, scope: :government_user) }
    scenario "they see a verify account message" do
      visit root_path

      expect(page).to have_text t("modules.confirm.heading")
    end
  end

  context "when a User has verified their account" do
    before { login_as(verified_user, scope: :government_user) }
    scenario "they do not see a verify account message" do
      visit root_path

      expect(page).to_not have_text t("modules.confirm.heading")
    end
  end

  def unverified_user
    @unverified_user ||= create(:user, :as_gov_user)
  end

  def verified_user
    @verified_user ||= create(:user, :as_gov_user, :verified)
  end
end
