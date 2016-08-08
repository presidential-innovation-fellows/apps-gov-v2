require "rails_helper"

describe Review do
  it { should validate_presence_of :description }
  it { should validate_presence_of :name }
  it { should validate_presence_of :slug }
end
