require "rails_helper"

describe ProductSubSubcategory do
  it { should belong_to :product }
  it { should belong_to :sub_subcategory }
  it { should validate_presence_of :product }
  it { should validate_presence_of :sub_subcategory }
end
