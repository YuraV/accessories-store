class CurrenciesController < ApplicationController
  before_filter :set_currency, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @currencies = Currency.all
    respond_with(@currencies)
  end

  def show
    respond_with(@currency)
  end

  def new
    @currency = Currency.new
    respond_with(@currency)
  end

  def edit
  end

  def create
    @currency = Currency.new(params[:currency])
    # @currency = Currency.create!(params[:currency])
    @currency.save
    respond_with @currency, location: currencies_path
  end

  def update
    @currency.update_attributes(params[:currency])
    respond_with(@currency)
  end

  def destroy
    @currency.destroy
    respond_with(@currency)
  end

  private
    def set_currency
      @currency = Currency.find(params[:id])
    end
end
