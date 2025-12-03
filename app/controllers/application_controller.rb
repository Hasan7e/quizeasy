class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :session_expiration
  before_action :log_admin_actions
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [ :phone_number ])
  devise_parameter_sanitizer.permit(:account_update, keys: [ :phone_number ])
end

private


# make sure only admin users can access certain actions
def require_admin!
  unless current_user&.admin?
    redirect_to root_path, alert: "Not authorized."
  end
end

# auto logout after 30 minutes of inactivity
def session_expiration
  if session[:last_seen] && session[:last_seen] < 30.minutes.ago
    sign_out current_user
    redirect_to new_user_session_path, alert: "Session expired. Please log in again."
  end
  session[:last_seen] = Time.current
end

  # log admin actions for auditing
  def log_admin_actions
    if current_user&.admin?
      Rails.logger.info("[ADMIN ACTION] #{current_user.email} accessed #{controller_name}##{action_name} at #{Time.current}")
    end
  end
end
