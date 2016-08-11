class AdminProductDraftJob
  def initialize(product)
    @product = product
  end

  def perform
    admins.each do |admin|
      AdminProductDraftMailer.send_email(
        admin,
        @product
      )
    end
  end

  private

  def admins
    User.where(admin: true)
  end
end
