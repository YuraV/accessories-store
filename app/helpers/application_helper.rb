module ApplicationHelper
  def development_env?
    Rails.env.eql?('development')
  end

  def request_customer_email?
    return true unless cookies[:user_data]
    user_data = JSON.parse(cookies[:user_data])
    user_data['email'].blank?
  end
end
