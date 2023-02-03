class Site::CategoriesController < SiteController
  before_action :set_item, only: %i[show]
  before_action :set_ads, only: %i[show]

  def show;end

  private
  def set_item
    @item = Category.friendly.find(params[:id])
  end

  def set_ads 
    @ads = Ad.where_category(@item[:id])
  end
end
