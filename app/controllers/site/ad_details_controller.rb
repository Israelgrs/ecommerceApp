class Site::AdDetailsController < SiteController
  before_action :set_ad

  def show

    respond_to do |format|
      format.html # views html.erb
      format.json { render json: @ad }
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
