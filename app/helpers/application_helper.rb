module ApplicationHelper

  def after_sign_in_path_for(resource)
    case resource
    when :user, User 
       users_dashboard_url
    else
       super
    end
  end

end
