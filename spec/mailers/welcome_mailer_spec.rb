require "rails_helper"

describe WelcomeMailer do
  describe "#send_email" do
    include ActionView::Helpers::UrlHelper
    it "sends an email with the correct information" do
      user = create(:user)
      mail = described_class.send_email(user)

      expect(mail.to).to include user.email
      expect(mail.from).to include ENV.fetch("MAILER_FROM_EMAIL")
      expect(mail.subject).to eq t("welcome_mailer.send_email.subject")
      expect(mail.body).to include user.first_name
    end
  end
end
