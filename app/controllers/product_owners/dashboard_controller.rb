module ProductOwners
  class DashboardController < ProductOwnersController
    def index
      @product_requests = current_product_owner.product_requests
    end
  end
end
