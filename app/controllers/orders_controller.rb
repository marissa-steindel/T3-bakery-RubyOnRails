class OrdersController < ApplicationController
  @statuses = %w[pending, paid, shipped]
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
