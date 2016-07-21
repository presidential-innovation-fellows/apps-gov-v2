require "rails_helper"

feature "User Sign In" do
  context "without JavaScript"do
    scenario "a User signs in" do
      visit root_path

      within("nav.app-nav") do
        click_on t("modules.navigation.sign_in")
      end

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on t("devise.sessions.form.sign_in")

      expect(page).to have_text t("modules.navigation.dashboard")
    end
  end

  context "with JavaScript" do
    scenario "a User signs in", js: true do
      visit root_path
      within("nav.app-nav") do
        click_on t("modules.navigation.sign_in")
      end

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      within("div#sign-in-modal") do
        click_on t("devise.sessions.form.sign_in")
      end
      expect(page).to have_text t("modules.navigation.dashboard")
    end
  end

  context "when a User has not confirmed their account for more than 2 days" do
    scenario "they can no longer sign in" do
      Timecop.travel(two_days_after_signup) do
        visit root_path

        within("nav.app-nav") do
          click_on t("modules.navigation.sign_in")
        end

        fill_in "Email", with: user.email
        fill_in "Password", with: user.password

        click_on t("devise.sessions.form.sign_in")

        expect(page).to have_text t("devise.failure.unconfirmed")
      end
    end
  end

  def two_days_after_signup
    user.created_at + 2.days
  end

  def user
    @user ||= create(:user)
  end
end
