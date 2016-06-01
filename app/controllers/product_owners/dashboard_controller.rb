module ProductOwners
  class DashboardController < ProductOwnersController
    def index
      @product_requests =
        current_product_owner.product_requests.where(published_at: nil)
      @approved_product_requests =
        current_product_owner.product_requests.where.not(published_at: nil)
    end
  end
end
