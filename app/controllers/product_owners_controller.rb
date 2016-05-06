class ProductOwnersController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do
    redirect_to new_product_owner_registration_path
  end
end
