class WelcomeController < ApplicationController
  respond_to :html, :json, :js

  helper_method :products

  def index

    respond_with products
  end

  def new

  end

  def products
    @products = Product.all
  end
end
