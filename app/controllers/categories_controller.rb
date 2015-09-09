class CategoriesController < ApplicationController

  helper_method :category, :sub_folders
  respond_to :html, :json

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    respond_with(category)
  end

  def new
    respond_with(category)
  end

  def edit
    respond_with(category)
  end

  def create
    category.save
    respond_with(category)
  end

  def update
    category.update_attributes(params[:category])
    respond_with(category)
  end

  def destroy
    @category = category.destroy
    respond_with(@category)
  end

  private
  def category
    @category = params[:id] ? Category.find(params[:id]) : Category.new(params[:category])
  end
  def sub_folders
    category.sub_folders
  end
end
