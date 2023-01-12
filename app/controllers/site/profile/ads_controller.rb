class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: %i[edit update]

  def index
    @ads = Ad.member_ads(current_member)
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.member = current_user

    if @ad.save
      redirect_to site_profile_ads_path, notice: I18n.t('messages.ad_create_success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @ad.update(ad_params)
      redirect_to site_profile_ads_path, notice: I18n.t('messages.ad_edit_success')
    else
      render :edit
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:id, :title, :category_id, :price,:finish_date,
                               :description, :picture)
  end
end
