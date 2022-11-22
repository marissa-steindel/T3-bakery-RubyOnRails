class ProductsController < ApplicationController
  # before any actions are performed, initialize the visit count session
  before_action :initialize_session
  before_action :increment_visit_count, only: [:index, :about]
  before_action :load_cart

  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    # add the product id parameter to the end of the cart array stored in the sessions hash with a key of cart
    # add the id to cart, unless it is already there
    session[:cart] << params[:id].to_i unless session[:cart].include?(params[:id].to_i)
    # prevent rails from trying to load up a view of the same name as the action
    redirect_to products_index_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to products_index_path
  end

  private
  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end

  def load_cart
    @cart_contents = Product.find(session[:cart])
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

end

