Rails.application.routes.draw do
  devise_for \
    :users,
    controllers: { registrations: "registrations", sessions: "sessions" }
  devise_for \
    :government_user,
    controllers: { registrations: "government_users/registrations", sessions: "sessions" }
  devise_for \
    :product_owner,
    controllers: { registrations: "product_owners/registrations", sessions: "sessions" }

  devise_scope :user do
    get "/signout", to: "sessions#destroy", as: :user_signout
  end

  namespace :admin do
    resources :products, only: [:new, :create]
  end

  namespace :product_owners do
    resources :product_requests, only: [:new, :create]
  end

  get "dashboard", to: "product_owners/dashboard#index", as: :product_owner_dashboard

  get "products/search", to: "products#search", as: :products_search

  resources :categories, only: [:show]

  resources :products, only: [:show] do
    resources :product_requests, only: [:create]
  end

  root to: "products#index"
end
