module ApplicationHelper

  def get_locale
    params[:locale] || 'en'
  end

  def after_sign_in_path_for(resource)
    case resource
    when :user, User
      dashboard_user_path(locale: get_locale)
    when :admin, Admin
      admin_root_path
    else
      super
    end
  end

end
