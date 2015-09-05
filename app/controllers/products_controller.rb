class ProductsController < ApplicationController
  respond_to :html, :json, :js

  helper_method :product

  def index
    @products = Product.all
  end

  def new
    respond_with product
  end

  def destroy
    redirect_to products_path
  end

  def edit
    respond_with product
  end

  def create
    product = Product.create params[:product]
    respond_with product
  end

  def update
    product.update_attributes params[:product]
    respond_with product
  end

  def show
    respond_with product
  end

  def preview
    product = Product.new(params[:product])
    render :preview, layout: false, locals: { product: product } if request.xhr?
  end

  private
  def product
    @product =
        if ['create', 'new'].include? params[:action]
          Product.new
        else
          Product.find(params[:id])
        end
  end
end
