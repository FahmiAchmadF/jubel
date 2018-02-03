class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource)
      if current_user and current_user.roles.include?('admin')
        admin_categories_path
      else
        products_path
      end
    end
end
