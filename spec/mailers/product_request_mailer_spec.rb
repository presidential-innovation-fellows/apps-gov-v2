require "rails_helper"

describe ProductRequestMailer do
  describe "#send_email" do
    include ActionView::Helpers::UrlHelper
    it "sends an email with the correct information" do
      user = create(:user)
      product = create(:product)
      mail = described_class.send_email(product, user)

      expect(mail.to).to include user.email
      expect(mail.from).to include ENV.fetch("MAILER_FROM_EMAIL")
      expect(mail.subject).to eq t("product_request_mailer.send_email.subject")
      expect(mail.body).to include user.first_name
      expect(mail.body).to include product.name
    end
  end
end
