require "rails_helper"

describe SubSubcategory do
  it { should belong_to :subcategory }
  it { should have_many :product_sub_subcategories }
  it { should have_many(:products).through(:product_sub_subcategories) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }

  context "uniqueness" do
    subject { create(:subcategory) }
    it { should validate_uniqueness_of :slug }
  end
end
