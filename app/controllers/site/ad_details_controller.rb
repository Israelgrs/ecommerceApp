class Site::AdDetailsController < SiteController
  before_action :set_ad

  def show
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
