Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :products, only: [:index, :show]
end
