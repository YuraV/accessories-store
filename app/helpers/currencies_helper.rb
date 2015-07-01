module CurrenciesHelper
  def currency_for_select
    Currency.pluck(:iso)
  end
end
