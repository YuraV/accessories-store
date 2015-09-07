class FiltersController < ApplicationController
  before_filter :set_filter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @filters = Filter.all
    respond_with(@filters)
  end

  def show
    respond_with(@filter)
  end

  def new
    @filter = Filter.new
    respond_with(@filter)
  end

  def edit
  end

  def create
    category = Category.find(params[:filter].delete :hidden_category)
    @filter = Filter.new(params[:filter].slice(Filter.accessible_attributes))
    @filter.save

    respond_with @filter do |format|
      format.html {
        render partial: 'filters/for_category', locals: { category: category } if request.xhr?
      }
    end
  end

  def update
    @filter.update_attributes(params[:filter])
    respond_with(@filter)
  end

  def destroy
    @filter.destroy
    respond_with(@filter)
  end

  private
    def set_filter
      @filter = Filter.find(params[:id])
    end
end
