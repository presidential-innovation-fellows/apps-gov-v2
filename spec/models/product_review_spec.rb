require "rails_helper"

describe ProductReview do
  it { should belong_to :product }
  it { should belong_to :review }
end
