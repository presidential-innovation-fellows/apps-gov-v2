module Admin
  class DashboardController < AdminController
    def index
      @product_requests =
        ProductRequest.joins(:product, :user).
        where("users.type = 'ProductOwner'").drafted
      @product_drafts =
        Draftsman::Draft.includes(:item).where(item_type: "Product", rejected: false)
    end
  end
end
