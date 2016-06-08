class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(_resource_or_scope)
    if request.referer && request.referer != new_user_session_url
      URI.parse(request.referer).path
    else
      super
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    if request.referer
      URI.parse(request.referer).path
    end
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def current_ability
    @current_ability ||= Ability.new(signed_in_user)
  end

  def signed_in_user
    current_user || current_government_user || current_product_owner
  end

  def user_for_draftsman
    if signed_in_user
      signed_in_user.id
    end
  end
end
