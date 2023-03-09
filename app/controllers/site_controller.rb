class SiteController < ApplicationController
  before_action :store_user_location!, if: :storable_location?
  before_action :set_categories
  layout 'site'


  private

  def set_categories
    @categories = Category.order_by_description
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:member, request.fullpath)
  end
end