Rails.application.routes.draw do

  root "products#index"

  get "customer/SignUp", to: "customers#add_customer", as: "add_customer"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "login", to: "customers#login", as: "login"

  get "checkout", to: "checkout#index", as: "checkout"
  get "checkout/apply_tax", to: "checkout#determine_tax", as: "apply_tax"
  get "checkout/province/:id", to: "checkout#determine_tax", as: "determine_tax"


  get 'products/index'
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

  # GET	      /photos	          photos#index	  display a list of all photos
  # POST	    /photos	          photos#create	  create a new photo
  # GET	      /photos/new	      photos#new	    return an HTML form for creating a new photo
  # GET	      /photos/:id	      photos#show	    display a specific photo
  # PATCH/PUT	/photos/:id	      photos#update	  update a specific photo
  # DELETE	  /photos/:id	      photos#destroy	delete a specific photo
  # GET	      /photos/:id/edit	photos#edit	    return an HTML form for editing a photo

  # photos_path           returns /photos
  # new_photo_path        returns /photos/new
  # edit_photo_path(:id)  returns /photos/:id/edit (edit_photo_path(10) returns /photos/10/edit)
  # photo_path(:id)       returns /photos/:id (photo_path(10) returns /photos/10)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
