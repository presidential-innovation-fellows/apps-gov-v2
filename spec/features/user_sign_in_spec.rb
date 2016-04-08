require "rails_helper"

feature "User Sign In" do
  scenario "a User signs in" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log in"

    expect(page).to have_text t("devise.sessions.signed_in")
  end

  def user
    @user ||= create(:user)
  end
end
