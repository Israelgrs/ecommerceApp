class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: %i[edit]

  def index
    @ads = Ad.member_ads(current_member)
  end

  def edit; end

  def update; end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
