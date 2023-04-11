class Checkout::PaymentsController < ApplicationController
  def create
    ad = Ad.find(params[:ad_id])
    ad.processing!

    order = Order.create(ad: ad, buyer_id: current_member.id)
    order.waiting!

    @order_ad = ad.title
  end
end
