class CustomerController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Cusomter.find(params[:id])
  end
end
