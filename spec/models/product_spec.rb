require "rails_helper"

describe Product do
  it { should have_many(:agencies).through(:customers) }
  it { should validate_presence_of :long_description }
  it { should validate_presence_of :name }
  it { should validate_presence_of :sales_poc }
  it { should validate_presence_of :short_description }
  it { should validate_presence_of :slug }
  it { should validate_presence_of :url }
end
