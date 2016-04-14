require "rails_helper"

describe Product do
  context "presence" do
    it { should have_many(:agencies).through(:customers) }
    it { should have_many(:contracts).through(:product_contracts) }

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
end
