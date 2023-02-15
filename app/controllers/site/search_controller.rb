class Site::SearchController < SiteController
  def ads
    @ads = Ad.search(params[:query], params[:page])
  end
end
