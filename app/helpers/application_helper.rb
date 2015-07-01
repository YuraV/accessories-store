module ApplicationHelper
  def development_env?
    Rails.env.eql?('development')
  end

  def request_customer_email?
    return true unless cookies[:user_data]
  begin
    user_data = JSON.parse(cookies[:user_data])
  rescue JSON::ParserError => e
    return true
  end
    user_data['email'].blank?
  end

  def usd_vs_uah
    t('currency.usd_price', price: 1)
  end

  def rate
    @rate ||= Currency.by("USD").first.rate
  end
end
