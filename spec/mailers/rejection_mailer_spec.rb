require "rails_helper"

describe RejectionMailer do
  describe "#send_email" do
    include ActionView::Helpers::UrlHelper

    it "sends an email with the correct information" do
      user = create(:user)
      product = create(:product)
      message = create(:message, author: user)
      mail = described_class.send_email(message, product, user)

      expect(mail.to).to include user.email
      expect(mail.from).to include ENV.fetch("MAILER_FROM_EMAIL")
      expect(mail.subject).to eq t("rejection_mailer.send_email.subject")
      expect(mail.body).to include user.first_name
      expect(mail.body).to include product.name
      expect(mail.body).to include message.content
    end
  end
end
