class SiteController < ApplicationController
  before_action :set_categories
  layout 'site'


  private

  def set_categories
    @categories = Category.order_by_description
  end
end