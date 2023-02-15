class Site::HomeController < SiteController

  def index
    @ads = Ad.descending_order(8, params[:page])
  end
end
