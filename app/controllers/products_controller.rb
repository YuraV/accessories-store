class ProductsController < ApplicationController
  respond_to :html, :json, :js

  before_filter :find_product, only: [:show, :edit]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new params[:product]
  end

  def edit
    respond_with @product
  end

  def create
    @product = Product.create params[:product]
    respond_with @product
  end

  def show
    respond_with @product
  end

  def preview
    @product = Product.new(params[:product])
    render :preview, layout: false, locals: { product: @product } if request.xhr?
    # respond_with @product, location: preview_products_path(@product), laout: false
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

end
