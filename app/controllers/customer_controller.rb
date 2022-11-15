class CustomerController < ApplicationController
  def index
    @customers = Customer.all
    @provinces = Province.all
  end
end
