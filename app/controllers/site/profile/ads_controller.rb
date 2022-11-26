class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = Ad.where(member: current_user)
  end
end
