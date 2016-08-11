require "rails_helper"

describe AdminProductDraftMailer do
  describe "#send_email" do
    include ActionView::Helpers::UrlHelper
    it "sends an email with the correct information" do
      admin = create(:user, :as_admin)
      product = create(:product)
      mail = described_class.send_email(admin, product)

      expect(mail.to).to include admin.email
      expect(mail.from).to include ENV.fetch("MAILER_FROM_EMAIL")
      expect(mail.subject).to eq subject
      expect(mail.body).to include product.name
    end
  end

  def subject
    t("admin_product_draft_mailer.send_email.subject")
  end
end
