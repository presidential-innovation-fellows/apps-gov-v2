require "rails_helper"

describe Subcategory do
  it { should have_many :product_subcategories }
  it { should have_many(:products).through(:product_subcategories) }
  it { should validate_presence_of :name }

  context "uniqueness" do
    subject { create(:subcategory) }
    it { should validate_uniqueness_of :slug }
  end
end
