require "rails_helper"

describe ContractOfficer do
  it { should belong_to :agency }
  it { should belong_to :user }
  it { should validate_presence_of :agency }
  it { should validate_presence_of :user }
end
