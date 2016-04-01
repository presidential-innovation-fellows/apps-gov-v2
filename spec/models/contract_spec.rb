require "rails_helper"

describe Contract do
  it { should validate_presence_of :description }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }
end
