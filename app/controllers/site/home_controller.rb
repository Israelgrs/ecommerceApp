class Site::HomeController < SiteController

  def index
    @ads = Ad.home_ads
  end
end
