require "rails_helper"

describe Keyword do
  it { should validate_presence_of :name }
end
