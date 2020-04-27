class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user, if: :user_signed_in?
  before_action :config_permitted_parameters, if: :devise_controller?

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
  end

  def authenticate_user
    @user = User.find_by(id: @current_user.id)
  end
end
