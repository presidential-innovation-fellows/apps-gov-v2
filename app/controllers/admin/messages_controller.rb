module Admin
  class MessagesController < AdminController
    def new
      @message = Message.new
      @product = Product.friendly.find(params[:product_id])
    end

    def create
      @message = Message.new(message_params)
      @product = Product.friendly.find(params[:product_id])
      @product_rejection = ProductRejection.new(@message, @product)

      if @product_rejection.create?
        flash[:success] = I18n.t("admin.messages.create.success")
        redirect_to dashboard_path
      else
        flash[:error] = I18n.t("admin.messages.create.error")
        render :new
      end
    end

    private

    def message_params
      params.require(:message).permit(:content).merge(author: current_user)
    end
  end
end
