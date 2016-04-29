require "rails_helper"

feature "User Signs Out" do
  before { login_as(user, scope: :government_user) }

  scenario "a User signs in" do
    visit root_path

    click_on t("modules.navigation.sign_out")

    expect(current_path).to eql(root_path)
  end

  def user
    @user ||= create(:user)
  end
end
