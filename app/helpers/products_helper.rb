module ProductsHelper
  def show_uah_price_of(product)
    I18n.t('currency.uah_price', price: MoneyUtils.usd_to_uah(product.price))
  end

  def show_usd_price_of(product)
    I18n.t('currency.usd_price', price: MoneyUtils.uah_to_usd(product.price))
  end
end
