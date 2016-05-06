require "rails_helper"

describe ProductRequest do
  it { should be_draftable }
  it { should belong_to :product }
  it { should belong_to :user }
  it { should validate_presence_of :product }
  it { should validate_presence_of :user }

  describe "uniqueness" do
    subject { FactoryGirl.build(:product_request) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:product_id) }
  end

  def product
    @product ||= create(:product)
  end

  def user
    @user ||= create(:user)
  end
end
