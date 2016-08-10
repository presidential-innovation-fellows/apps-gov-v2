class AdminProductRequestJob
  def initialize(product_request)
    @product_request = product_request
  end

  def perform
    admins.each do |admin|
      AdminProductRequestMailer.send_email(
        admin,
        @product_request.product,
        @product_request.user
      )
    end
  end

  private

  def admins
    User.where(admin: true)
  end
end
