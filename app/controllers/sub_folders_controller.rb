class SubFoldersController < ApplicationController

  helper_method :sub_folder, :category, :category_sub_folders
  respond_to :html

  def index
    respond_with(category_sub_folders)
  end

  def show
    respond_with(sub_folder)
  end

  def new
    respond_with(sub_folder, layout: false)
  end

  def edit
  end

  def create
    sub_folder.save
    respond_with(sub_folder)
  end

  def update
    sub_folder.update_attributes(params[:sub_folder])
    respond_with(sub_folder)
  end

  def destroy
    @sub_folder = sub_folder.destroy
    respond_with(@sub_folder)
  end

  private
  def sub_folder
    @sub_folder = params[:id] ? SubFolder.find(params[:id]) : SubFolder.new
  end

  def category_sub_folders
    @category_sub_folders ||= category.sub_folders
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end
