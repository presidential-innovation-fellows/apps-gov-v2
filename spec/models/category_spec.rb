require "rails_helper"

describe Category do
  it { should have_many(:subcategories).dependent(:destroy) }
  it { should validate_presence_of :name }

  context "uniqueness" do
    subject { create(:category) }
    it { should validate_uniqueness_of :slug }
  end
end
