require "rails_helper"

describe Agency do
  it { should have_many(:products).through(:customers) }
  it { should have_many :users }
  it { should validate_presence_of :code }
  it { should validate_presence_of :name }
end
