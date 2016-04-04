require "rails_helper"

describe ProductContract do
  it { should validate_presence_of :contract }
  it { should validate_presence_of :product }
end
