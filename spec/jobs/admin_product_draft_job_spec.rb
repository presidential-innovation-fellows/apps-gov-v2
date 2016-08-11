require "rails_helper"

describe AdminProductDraftJob do
  describe "#perform" do
    before { create_list(:user, 3, :as_admin) }

    it "sends each Admin an email" do
      allow(AdminProductDraftMailer).to receive(:send_email)

      admin_product_draft_job.perform

      expect(AdminProductDraftMailer).
        to have_received(:send_email).exactly(3).times
    end
  end

  def admin_product_draft_job
    @admin_product_draft_job ||= AdminProductDraftJob.new(product)
  end

  def admin
    @admins ||= create(:user, :as_admin)
  end

  def product
    @product ||= create(:product)
  end
end
