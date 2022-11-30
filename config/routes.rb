Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#about"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  get 'categories/index'
  get 'categories/show'

  get 'products/index'
  # get 'products/:id', to: "products#show", as: "product"
  post 'products/add_to_cart/:id', to: "products#add_to_cart", as: "add_to_cart"
  delete 'products/remove_from_cart/:id', to: "products#remove_from_cart", as: "remove_from_cart"
  resources 'products', only: [:index, :show] do
    collection do
      get 'search_results'
    end
  end

  get "customer/index"

  get 'provinces/index'
  get 'provinces/show'
  get "/provinces/:id", to: "provinces#show"

  resources :customers
  resources :provinces
  resources :categories

end
