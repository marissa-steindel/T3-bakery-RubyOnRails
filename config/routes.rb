Rails.application.routes.draw do
  root "customer#index"
  get "customer/index"
  get 'province/index'
  get 'province/show'
  get "/province/:id", to: "province#show"

  resources :customers
  resources :provinces

end
