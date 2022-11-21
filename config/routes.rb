Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#about"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  get 'categories/index'
  get 'categories/show'

  get 'products/index'
  get 'products/:id', to: "products#show", as: "product"

  get "customer/index"

  get 'provinces/index'
  get 'provinces/show'
  get "/provinces/:id", to: "provinces#show"

  resources :customers
  resources :provinces

end
