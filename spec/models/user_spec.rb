require "rails_helper"

describe User do
  it { should belong_to :agency }
  it { should have_many(:products).through(:product_requests) }
  it { should have_many :product_requests }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  describe "abilities" do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context "when a guest" do
      let(:user) { build(:user) }

      it { should_not be_able_to(:manage, Product.new) }
    end

    context "when a GovernmentUser" do
      let(:user) { create(:user, :as_gov_user) }
      it { should be_able_to(:create, ProductRequest.new) }
    end

    context "when a ProductOwner" do
      let(:user) { product_owner }
      it { should be_able_to(:create, ProductRequest.new) }

      it do
        product = create(:product)
        create(:product_request, product: product, user: product_owner)
        should be_able_to(:manage, product)
      end
    end

    context "when an admin" do
      let(:user) { create(:user, admin: true) }

      it { should be_able_to(:manage, Product.new) }
    end
  end

  def product_owner
    @product_owner ||= create(:user, :as_product_owner)
  end
end
