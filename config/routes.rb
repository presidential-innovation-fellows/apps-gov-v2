Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_for \
    :government_user,
    controllers: { registrations: "government_users/registrations" }

  namespace :admin do
    resources :products, only: [:new, :create]
  end

  resources :products, only: [:index, :show]
end
