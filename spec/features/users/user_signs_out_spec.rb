require "rails_helper"

feature "User Signs Out" do
  before { login_as(user, scope: :government_user) }

  context "when a User has JS enabled", js: true do
    scenario "they use the account dropdown to log out" do
      visit root_path

      click_on user.name
      click_link "sign-out-js"

      expect(page).to_not have_text t("modules.confirm.description")
    end
  end

  def user
    @user ||= create(:user, :as_gov_user)
  end
end
