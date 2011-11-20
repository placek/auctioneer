class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options={})
    options.merge({ locale: I18n.locale })
  end

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admin_root_path
    else
      users_dashboard_path
    end
  end
end
