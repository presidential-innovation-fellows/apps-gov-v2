require "rails_helper"

describe ProductOwners::ProductRequestsController do
  describe "#create" do
    it "enqueues the AdminProductRequestJob" do
      sign_in_user(product_owner)

      allow(ProductRequest).to receive(:new).and_return(product_request)
      allow(product_request).to receive(:draft_creation).and_return(true)
      allow(Delayed::Job).to receive(:enqueue).and_return(true)

      post :create, params: { product_request: { product_id: product.id } }

      expect(Delayed::Job).to have_received(:enqueue)
    end
  end

  def product
    @product ||= create(:product)
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end

  def product_request
    @product_request ||= build(:product_request, product: product)
  end
end
