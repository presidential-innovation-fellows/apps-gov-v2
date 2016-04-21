Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :admin do
    resources :products, only: [:new, :create]
  end

  namespace :registration do
    get \
      "/government-employees",
      to: "government_employees#new",
      as: :government_employee
  end

  resources :products, only: [:index, :show]
end
