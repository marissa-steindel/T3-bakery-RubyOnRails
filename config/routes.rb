Rails.application.routes.draw do

  root "pages#about"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  get 'products/index'
  get "checkout", to: "products#checkout", as: "checkout"
  get 'checkout/checkout'
  get "checkout/province", to: "products#determine_tax", as: "determine_tax"

  # get 'products/:id', to: "products#show", as: "product"
  post 'products/add_to_cart/:id', to: "products#add_to_cart", as: "add_to_cart"
  delete 'products/remove_from_cart/:id', to: "products#remove_from_cart", as: "remove_from_cart"
  delete 'products/decrement_from_cart/:id', to: "products#decrement_from_cart", as: "decrement_from_cart"
  get 'products/clear_cart', to: "products#clear_cart", as: "clear_cart"

  resources 'products', only: [:index, :show] do
    collection do
      get 'search_results'
    end
  end

  # get 'orders/index'
  # get 'orders/show'

  # get 'categories/index'
  # get 'categories/show'

  # get "customers/index"

  # get 'provinces/index'
  # get 'provinces/show'
  # get "/provinces/:id", to: "provinces#show"

  resources :customers
  resources :provinces
  resources :categories
  resources :orders

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
