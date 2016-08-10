require "rails_helper"

describe AdminProductRequestMailer do
  describe "#send_email" do
    include ActionView::Helpers::UrlHelper
    it "sends an email with the correct information" do
      admin = create(:user, :as_admin)
      user = create(:user)
      product = create(:product)
      mail = described_class.send_email(admin, product, user)

      expect(mail.to).to include admin.email
      expect(mail.from).to include ENV.fetch("MAILER_FROM_EMAIL")
      expect(mail.subject).to eq t("admin_product_request_mailer.send_email.subject")
      expect(mail.body).to include user.name
      expect(mail.body).to include product.name
    end
  end
end
