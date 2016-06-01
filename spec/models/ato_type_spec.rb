require "rails_helper"

describe AtoType do
  it { should have_many :ato_statuses }
  it { should have_many(:products).through(:ato_statuses) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }

  context "uniqueness" do
    subject { create(:ato_type) }
    it { should validate_uniqueness_of :slug }
  end
end
