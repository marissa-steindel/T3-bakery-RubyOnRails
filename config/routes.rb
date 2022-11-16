Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "provinces#about"
  get "about", to: "provinces#about"
  get "contact", to: "provinces#contact"

  get "customer/index"
  get 'provinces/index'
  get 'provinces/show'
  get "/provinces/:id", to: "provinces#show"

  resources :customers
  resources :provinces

end
