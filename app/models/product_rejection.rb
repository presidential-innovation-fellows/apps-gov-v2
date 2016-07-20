class ProductRejection
  def initialize(message, product)
    @message = message
    @product = product
  end

  def create?
    if @message.save!
      @product.draft.update_attributes(rejected: true)
      RejectionMailer.send_email(@message, @product, @message.author)
    end
  end
end
