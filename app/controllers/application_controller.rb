class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user, if: :user_signed_in?
  before_action :config_permitted_parameters, if: :devise_controller?

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end
  

  def authenticate_user
    @current_user = User.find_by(id: @current_user.id)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
