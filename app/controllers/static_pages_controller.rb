class StaticPagesController < ApplicationController

  def home
  end

  def landing
    parsed_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first) || 'en'
    redirect_to home_path(parsed_locale) if I18n.available_locales.include?(parsed_locale.to_sym)
  end

end
