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

  get "products/search", to: "products#search", as: :products_search

  resources :categories, only: [:show]

  resources :products, only: [:show] do
    resources :product_requests, only: [:create]
  end

  root to: "products#index"
end
