class ProductsController < ApplicationController
  respond_to :html, :json, :js

  def index
    @products = Product.all
  end

  def new
    @product = Product.new params[:product]
  end

  def create
    @product = Product.create params[:product]
    respond_with @product
  end

end
