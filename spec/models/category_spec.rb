require "rails_helper"

describe Category do
  it { should have_many :product_categories }
  it { should have_many(:products).through(:product_categories) }
  it { should validate_presence_of :name }

  context "uniqueness" do
    subject { create(:category) }
    it { should validate_uniqueness_of :slug }
  end
end
