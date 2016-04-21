require "rails_helper"

describe ProductCategory do
  it { should belong_to :category }
  it { should belong_to :product }
  it { should validate_presence_of :category }
  it { should validate_presence_of :product }
end
