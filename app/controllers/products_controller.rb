class ProductsController < ApplicationController

  # before any controller actions are performed, run the following (private) functions
  before_action :initialize_session #create empty cart array, or visit count set to 0, if not already initialized
  before_action :increment_visit_count, only: [:index, :about]
  before_action :load_cart_variable

  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results

    if params[:commit] == "Filter"
      @products = Product.joins(:categories).where(categories: {id: params[:category].to_i}).distinct
    end

    unless params[:filter].blank?
      days = 60
      if params[:filter] == "new"
        @filter_heading = "New Products!"
        @filter_tagline = "Products posted in the last #{days} days."
        @products = Product.where("created_at > ?", Time.now - days.day)
      elsif params[:filter] == "sale"
        @filter_heading = "On Sale!"
        @filter_tagline = "Products whose price has been reduced in the last #{days} days."
        @products = Product.where("created_at > ?", Time.now - days.day)
      elsif params[:filter] == "recent"
        days = 5
        @filter_heading = "Recently Updated!"
        @filter_tagline = "Products that have been updated in the last #{days} days."
        @products = Product.where("updated_at > ?", Time.now - days.day)
      end
    end

    if params[:commit] == "Search"
      # search without category filter
      if params[:category].empty?
        @products = Product.where("name LIKE ?", "%#{params[:query]}%")

      # search with category filter
      else
        @products = Product.joins(:categories).distinct
        # @products = Product.where("name LIKE ?", "%#{params[:query]}%").joins(:categories).where(category: {id: params[:category]}.to_i).distinct
      end
    end

  end

  def filter_by_category
    # retrieve from the product_categories join table
    # select product_id from product_categories where category_id is X
    # product.id = product_category= product_id

    @products = Product.joins(:categories).where(categories: {id: params[:category]}).distinct
    # Product.join(:product_categories)
    # SELECT * FROM products JOIN product_categories ON product.id = product_categories.product_id

    # Book.joins(:reviews)
    # SELECT * FROM books JOIN reviews ON reviews.book_id = books.id
  end

  def add_to_cart
    prod_key = params[:id] # is of datatype string
    # add the product id parameter to the end of the cart array stored in the sessions hash with a key of cart
    # add the id to cart, unless it is already there
    # session[:cart] << params[:id].to_i unless session[:cart].include?(params[:id].to_i)
    if session[:cart].keys.include?(prod_key)
      # if session[:cart].has_key?(prod_key)
          # product is already in the cart, increment
        session[:cart][prod_key] += 1
      else
        # product is not in the cart
        session[:cart][prod_key] = 1
      end

    # prevent rails from trying to load up a view of the same name as the action
    redirect_to products_index_path
  end

  def remove_from_cart
    prod_key = params[:id]
    session[:cart].delete(prod_key)

    redirect_to products_index_path
  end

  def decrement_from_cart
    prod_key = params[:id]
    if session[:cart][prod_key] == 1
      session[:cart].delete(prod_key)
    else
      session[:cart][prod_key] -= 1
    end

    redirect_to products_index_path
  end

  def clear_cart
    session[:cart] = Hash.new
    redirect_to products_index_path
  end

  def determine_tax
    @taxes = Tax.where(id: params[].to_i)
  end

  private
  def initialize_session
    session[:visit_count] ||= 0
    # session[:cart] ||= []
    session[:cart] ||= Hash.new
  end

  def load_cart_variable
    # loads a set of objects from the db
    # @cart_contents = Product.find(session[:cart])
    @cart_contents = Product.find(session[:cart].keys)
    # @cart_contents = Product.find(session[:cart][:prod_key])
    @cart_subtotal = 0
    session[:cart].each do |prod_id,qty|
      price = Product.find(prod_id.to_i).price
      @cart_subtotal += (price*qty)/100.0
    end
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

end

