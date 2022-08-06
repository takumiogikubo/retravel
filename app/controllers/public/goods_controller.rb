class Public::GoodsController < ApplicationController

  def create
    travel = Travel.find(params[:travel_id])
    good = current_customer.goods.new(travel_id: travel.id)
    good.save
    redirect_back fallback_location: root_path
  end

  def destroy
    travel = Travel.find(params[:travel_id])
    good = current_customer.goods.find_by(travel_id: travel.id)
    good.destroy
    redirect_back fallback_location: root_path
  end

end
