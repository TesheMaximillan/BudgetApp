class ApplicationController < ActionController::Base
  before_action :config_devise_params, if: :devise_controller?
  layout :layout_by_resource

  protected

  def config_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confirmation])
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      categories_path(resource)
    else
      super
    end
  end

  private

  def layout_by_resource
    devise_controller? ? "session" : "application"
  end
end
