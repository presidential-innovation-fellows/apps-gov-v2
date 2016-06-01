require "rails_helper"

describe AtoStatus do
  it { should belong_to :ato_type }
  it { should belong_to :product }
  it { should validate_presence_of :ato_type }
  it { should validate_presence_of :product }
end
