class CustomersController < ApplicationController
  respond_to :html, :json, :js
  def new
    @customer = Customer.new params[:customer]
    respond_with @customer, layout: false if request.xhr?
  end

  def create
    @customer = Customer.create params[:customer]
    @customer.errors.empty? ? flash_message(:notice) : flash_message(:error, :msg => @backup.errors.full_messages.to_sentence)
  end
end