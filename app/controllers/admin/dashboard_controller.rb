module Admin
  class DashboardController < AdminController
    def index
      @product_requests =
        ProductRequest.joins(:product, :user).
        where("users.type = 'ProductOwner'").drafted
    end
  end
end
