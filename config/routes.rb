Rails.application.routes.draw do
  devise_for \
    :users,
    controllers: { registrations: "registrations", sessions: "sessions" }
  devise_for \
    :government_user,
    controllers: { registrations: "government_users/registrations", sessions: "sessions" }

  namespace :admin do
    resources :products, only: [:new, :create]
  end

  resources :products, only: [:index, :show] do
    resources :product_requests, only: [:create]
  end
end
