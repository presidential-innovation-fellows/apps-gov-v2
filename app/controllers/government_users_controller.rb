class GovernmentUsersController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do
    redirect_to new_government_user_registration_path
  end
end
