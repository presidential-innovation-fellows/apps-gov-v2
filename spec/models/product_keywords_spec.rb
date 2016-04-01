require "rails_helper"

describe ProductKeyword do
  it { should belong_to :keyword }
  it { should belong_to :product }
  it { should validate_presence_of :keyword }
  it { should validate_presence_of :product }
end
