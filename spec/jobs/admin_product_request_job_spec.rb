require "rails_helper"

describe AdminProductRequestJob do
  describe "#perform" do
    before { create_list(:user, 3, :as_admin) }

    it "sends each Admin an email" do
      allow(AdminProductRequestMailer).to receive(:send_email)

      admin_product_request_job.perform

      expect(AdminProductRequestMailer).
        to have_received(:send_email).exactly(3).times
    end
  end

  def admin_product_request_job
    @admin_product_request_job ||= AdminProductRequestJob.new(product_request)
  end

  def admin
    @admins ||= create(:user, :as_admin)
  end

  def product_request
    @product_request ||= create(:product_request)
  end
end
