# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end