require "rails_helper"

describe Product do
  context "presence" do
    it { should have_many(:agencies).through(:customers) }
    it { should have_many(:categories).through(:product_categories) }
    it { should have_many(:contracts).through(:product_contracts) }
    it { should have_many :product_requests }

    it do
      should validate_attachment_content_type(:logo).
        allowing("image/png", "image/gif").
        rejecting("text/plain", "text/xml")
    end

    it { should validate_presence_of :name }
    it { should validate_presence_of :short_description }
    it { should validate_presence_of :slug }
    it { should validate_presence_of :url }
  end

  context "uniqueness" do
    subject { create(:product) }
    it { should validate_uniqueness_of :slug }
  end

  describe "#loan_url" do
    it "returns the logo image url" do
      product = create(:product)

      expect(product.logo_url).to include "original"
      expect(product.logo_url).to include "sample-logo.png"
    end
  end

  describe "#trigger_delayed_job" do
    context "when a record is removed" do
      it "removes the Product from the index" do
        allow(product).to receive(:remove_from_index!).and_return(true)
        described_class.trigger_delayed_job(product, true)

        expect(Delayed::Job.count).to eq(1)
      end
    end

    context "when a Product is not removed" do
      it "calls the reindex method" do
        allow(product).to receive(:index!).and_return(true)
        described_class.trigger_delayed_job(product, false)

        expect(Delayed::Job.count).to eq(1)
      end
    end
  end

  def product
    @product ||= create(:product)
  end
end
