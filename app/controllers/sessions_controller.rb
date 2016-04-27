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
    sign_out(current_user.type.underscore)
    super
  end
end
