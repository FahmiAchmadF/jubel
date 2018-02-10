class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
    raise ActionController::RoutingError.new('Forbidden')
  end

  protected
    def after_sign_in_path_for(resource)
      if current_user and current_user.roles.include?('admin')
        admin_categories_path
      else
        products_path
      end
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:name, :username, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:name, :username, :password, :password_confirmation, :current_password, :avatar)
      end
    end
end
