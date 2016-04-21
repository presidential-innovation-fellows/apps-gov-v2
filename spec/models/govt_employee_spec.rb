require "rails_helper"

describe GovtEmployee do
  it { should belong_to :user }
  it { should validate_presence_of :user }
end
