class CheckoutController < ApplicationController
  before_action :initialize_session
  before_action :load_cart_variable

  def index
  end

  def determine_tax
    @province = Province.find(params[:id].to_i)
    @taxes = {"GST" => @province.GST, "PST" => @province.PST, "HST" => @province.HST}
    @GST_due = (@province.GST)*(@cart_subtotal)/100.0
    @PST_due = (@province.PST)*(@cart_subtotal)/100.0
    @HST_due = (@province.HST)*(@cart_subtotal)/100.0
    @total_tax_amount = @GST_due + @PST_due + @HST_due
    @cart_grandtotal = (@cart_subtotal + @total_tax_amount)
  end

  private
  def initialize_session
    session[:visit_count] ||= 0
    # session[:cart] ||= []
    session[:cart] ||= Hash.new
  end

  def load_cart_variable
    @cart_contents = Product.find(session[:cart].keys)
    @cart_subtotal = 0

    session[:cart].each do |prod_id,qty|
      price = Product.find(prod_id.to_i).price
      @cart_subtotal += (price*qty)/100.0
    end
  end

end
