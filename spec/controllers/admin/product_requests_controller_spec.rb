require "rails_helper"

describe Admin::ProductRequestsController do
  describe "#update" do
    it "sends an email when successful" do
      sign_in_user(admin)
      allow(ProductRequestMailer).to receive(:send_email).and_return(true)

      put :update, params: { id: product_request.id }

      expect(ProductRequestMailer).to have_received(:send_email)
    end
  end

  def product_request
    @product_request ||= create(:product_request, :with_draft)
  end

  def admin
    @admin ||= create(:user, :as_admin)
  end
end
