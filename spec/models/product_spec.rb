require "rails_helper"

describe Product do
  context "associations" do
    it { should have_many(:agencies).through(:customers) }
    it { should have_many(:ato_statuses).dependent(:destroy) }
    it { should have_many(:ato_types).through(:ato_statuses) }
    it { should have_many(:contracts).through(:product_contracts) }
    it { should have_many(:product_requests).dependent(:destroy) }
    it { should have_many(:product_reviews).dependent(:destroy) }
    it { should have_many(:product_sub_subcategories).dependent(:destroy) }
    it { should have_many(:reviews).through(:product_reviews) }
    it { should have_many(:users).through(:product_requests) }

    it do
      should have_many(:sub_subcategories).through(:product_sub_subcategories)
    end
  end

  context "attachments" do
    it do
      should validate_attachment_content_type(:logo).
        allowing("image/png", "image/gif").
        rejecting("text/plain", "text/xml")
    end
  end

  context "draftable" do
    it { should be_draftable }
  end

  context "presence" do
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

  describe "#most_popular" do
    it "only returns the most popular Products with Government Users" do
      create(:product, :with_gov_user)
      create(:product, :with_product_owner)

      expect(Product.all.most_popular.length).to eq(1)
    end

    it "returns 3 Products max" do
      create_list(:product, 5, :with_gov_user)

      expect(Product.all.most_popular.length).to eq(3)
    end
  end

  describe "#trigger_delayed_job" do
    context "when a record is destroyed" do
      it "removes the Product from the index" do
        allow(product).to receive(:remove_from_index!).and_return(true)
        described_class.trigger_delayed_job(product, true)

        expect(Delayed::Job.count).to eq(2)
      end
    end

    context "when a Product is not removed" do
      it "calls the reindex method" do
        allow(product).to receive(:index!).and_return(true)
        described_class.trigger_delayed_job(product, false)

        expect(Delayed::Job.count).to eq(2)
      end
    end
  end

  def product
    @product ||= create(:product)
  end
end
