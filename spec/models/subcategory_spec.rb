require "rails_helper"

describe Subcategory do
  it { should belong_to :category }
  it { should have_many :sub_subcategories }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }

  context "uniqueness" do
    subject { create(:subcategory) }
    it { should validate_uniqueness_of :slug }
  end
end
