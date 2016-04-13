Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :admin do
    resources :products, only: [:new, :create]
  end

  resources :products, only: [:index, :show]
end
