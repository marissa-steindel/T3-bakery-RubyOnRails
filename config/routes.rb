Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "province#about"
  get "about", to: "province#about"
  get "contact", to: "province#contact"

  get "customer/index"
  get 'province/index'
  get 'province/show'
  get "/province/:id", to: "province#show"

  resources :customers
  resources :provinces

end
