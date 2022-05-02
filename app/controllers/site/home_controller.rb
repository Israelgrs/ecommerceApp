class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.all.order(description: :asc)
  end
end
