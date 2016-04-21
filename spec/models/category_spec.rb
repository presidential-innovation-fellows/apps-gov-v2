require "rails_helper"

describe Category do
  it { should have_many :product_categories }
  it { should have_many(:products).through(:product_categories) }
  it { should validate_presence_of :name }
end
