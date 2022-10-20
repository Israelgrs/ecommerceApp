class ApplicationController < ActionController::Base
  # Pundit
  include Pundit::Authorization

  # Set Layout
  layout :layout_by_resource

  # Managers Pundit Not authorized error
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    return current_member if current_member.present?

    current_admin
  end

  protected

  def user_not_authorized
    flash[:alert] = 'Você não tem permissão para realizar esta ação'
    redirect_back(fallback_location: backoffice_path)
  end

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      'backoffice_devise'
    else
      'application'
    end
  end
end
