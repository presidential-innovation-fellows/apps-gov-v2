require "rails_helper"

describe ProductOwners::ProductsController do
  describe "#create" do
    it "enqueues the AdminProductDraftJob" do
      sign_in_user(product_owner)

      allow(Product).to receive(:new).and_return(unsaved_product)
      allow(unsaved_product).to receive(:draft_creation).and_return(true)
      allow(Delayed::Job).to receive(:enqueue).and_return(true)

      post :create, product: { name: "Product" }

      expect(Delayed::Job).to have_received(:enqueue)
    end
  end

  describe "#update" do
    it "enqueues the AdminProductDraftJob" do
      sign_in_user(product_owner)
      create(:product_request, user: product_owner, product: saved_product)

      allow_any_instance_of(Product).to receive(:draft_update).and_return(true)
      allow(Delayed::Job).to receive(:enqueue).and_return(true)

      put :update, id: saved_product.id, product: { name: "New Name" }

      expect(Delayed::Job).to have_received(:enqueue)
    end
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end

  def saved_product
    @product ||= create(:product)
  end

  def unsaved_product
    @product ||= build(:product)
  end
end
