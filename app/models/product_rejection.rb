class ProductRejection
  def initialize(message, product)
    @message = message
    @product = product
  end

  def create?
    if @message.save!
      @product.draft.update_attributes(rejected: true)
    end
  end
end
