class Site::HomeController < SiteController

  def index
    @ads = Ad.descending_order
  end
end
