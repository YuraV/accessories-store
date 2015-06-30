class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_action :set_locale
  #
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  # short form flash_message(:notice)
  # long form for flash.now
  # flash_message(:error2, {:msg => 'bbb'}, :now)
  # flash_message(:error_occurred, :type => :error) gets message from :controller.:action.flash.error_occurred and displays as :error
  def flash_message(key, args = {}, flash_type = :now)
    flash_style = (args.empty? ? nil : args.delete(:type)) || key.to_s.gsub(/\d/, '').to_sym
    msg = I18n.t("#{params[:controller]}.#{params[:action]}.flash.#{key}", args)
    flash_type.eql?(:now) ? flash.now[flash_style] = msg : flash[flash_style] = msg
  end

  # short form flash_message(key, args = {}, :now)
  # e.g.: flash_message_now(:error) eql to flash.now[:error]
  def flash_message_now(key, args = {})
    flash_message(key, args, :now)
  end
end
