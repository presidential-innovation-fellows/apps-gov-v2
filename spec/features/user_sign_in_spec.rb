require "rails_helper"

feature "User Sign In" do
  context "without JavaScript"do
    scenario "a User signs in" do
      visit products_path

      within("nav.app-nav") do
        click_on t("modules.navigation.sign_in")
      end

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on t("devise.sessions.form.sign_in")

      expect(page).to have_text "Signed in successfully"
    end
  end

  context "with JavaScript" do
    scenario "a User signs in", js: true do
      visit products_path
      within("nav.app-nav") do
        click_on t("modules.navigation.sign_in")
      end

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      within("div#sign-in-modal") do
        click_on t("devise.sessions.form.sign_in")
      end
      expect(page).to have_text "Signed in successfully"
    end
  end

  def user
    @user ||= create(:user)
  end
end
