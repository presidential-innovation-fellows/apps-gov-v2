require "rails_helper"

describe ProductRejection do
  describe "create?" do
    before do
      allow(Message).to receive(:new).and_return(message)
      allow(message).to receive(:save!).and_return(true)
      ProductRejection.new(message, product).create?
    end
    it "creates a Message" do
      expect(message).to have_received(:save!)
    end

    it "rejects the Product Draft" do
      expect(product.draft.rejected).to eq(true)
    end
  end

  def message
    @message ||= build(:message, author: user)
  end

  def product
    @product ||= create(:product, :with_draft)
  end

  def user
    @user ||= create(:user, :as_admin)
  end
end
