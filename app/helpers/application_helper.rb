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

  def sortable(column)
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    css_class = column == params[:sort] ? "sortable current_#{direction}" : nil
    link_to t("auctions.#{column}"), params.merge(sort: column, direction: direction, page: nil), class: css_class
  end

end
