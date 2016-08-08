require "rails_helper"

describe Review do
  it { should have_many(:products).through(:product_reviews) }
  it { should have_many :product_reviews }
  it { should validate_presence_of :description }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }

  context "uniqueness" do
    subject { create(:review) }
    it { should validate_uniqueness_of :slug }
  end
end
