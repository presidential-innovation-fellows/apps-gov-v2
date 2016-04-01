require "rails_helper"

describe Customer do
  it { should belong_to :agency }
  it { should belong_to :product }
end
