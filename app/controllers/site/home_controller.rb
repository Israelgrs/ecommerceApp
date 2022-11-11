class Site::HomeController < ApplicationController
  layout 'site'

  def index
    @categories = Category.order_by_description
    @ads = Ad.home_ads
  end
end
