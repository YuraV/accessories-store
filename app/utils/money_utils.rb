module MoneyUtils
  extend self

  def usd_to_uah(usd)
    (usd * InfoHub.get(:currency, :USD, :rate).to_f).ceil
    # uah = (usd * Currency.by("USD").first.rate).ceil
  end

  def eur_to_uah(eur)
    (eur * InfoHub.get(:currency, :EUR, :rate).to_f).ceil
  end

  def convert_by_currency(price,currency)
    return unless currency
    currency.eql?("USD")? "#{usd_to_uah(price)} UAH" : "#{uah_to_usd(price)} USD"
  end
end