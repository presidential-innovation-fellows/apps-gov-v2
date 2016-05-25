class SessionsController < Devise::SessionsController
  layout "minimal"

  def create
    rtn = super
    if resource.type.present?
      sign_in(
        resource.type.underscore,
        resource.type.constantize.send(:find, resource.id)
      )
    end
    rtn
  end

  def destroy
    sign_out(signed_in_user.type.underscore)
    super
  end

  private

  def user_type
    if signed_in_user.type.present?
      signed_in_user.type.underscore
    else
      "user"
    end
  end
end
