class CustomersController < ApplicationController
  respond_to :html, :json, :xml, :js

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new params[:customer]
    respond_with @customer, layout: false if request.xhr?
  end

  def create
    # @customer = Customer.create params[:customer]

    @customer = CustomerService::Creator.create!(params[:customer], cookies)
    respond_with @customer if request.xhr?
  end
end