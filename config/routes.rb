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
    resources :product_requests, only: [:edit, :update, :destroy]
    resources :products, only: [:create, :edit, :new, :update] do
      resources :messages, only: [:create, :new]
    end
  end

  namespace :government_users do
    resources :products, shallow: true do
      resources :product_requests, only: [:create, :new]
    end
  end

  namespace :product_owners do
    resources :product_requests, only: [:new, :create, :destroy]
    resources :products, only: [:edit, :update]
  end

  constraints(RoleRouteConstraint.new("user")) do
    get "/dashboard", to: "admin/dashboard#index", as: :admin_dashboard
  end

  constraints(RoleRouteConstraint.new("product_owner")) do
    get "/dashboard", to: "product_owners/dashboard#index", as: :product_owner_dashboard
  end

  get "/dashboard", to: redirect("/")

  get "/products/search", to: "products#search", as: :products_search

  resources :categories, only: [:show]
  resources :products, only: [:index, :show]

  root to: "products#index"
end
