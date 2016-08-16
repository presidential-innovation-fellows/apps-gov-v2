require "rails_helper"

describe ProductSubcategory do
  it { should belong_to :product }
  it { should belong_to :subcategory }
  it { should validate_presence_of :product }
  it { should validate_presence_of :subcategory }
end
