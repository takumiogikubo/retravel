class Public::TravelDetailsController < ApplicationController

  def new
    @travel=Travel.find(params[:travel_id])
    @travel_detail=@travel.travel_details.build
  end

  def create
    travel=Travel.find(params[:travel_id])
    travel_detail = travel.travel_details.build(travel_detail_params)
    travel_detail.save
    @travel=Travel.find(params[:travel_id])
    redirect_to travel_path(@travel.id)
  end

  def edit
    @travel=Travel.find(params[:travel_id])
    @travel_detail=@travel.travel_details.find(params[:id])
  end

  def update
    travel=Travel.find(params[:travel_id])
    travel_detail = travel.travel_details.find(params[:id])
    travel_detail.update(travel_detail_params)
    travel=Travel.find(params[:travel_id])
    redirect_to travel_path(travel.id)
  end

  def destroy
    travel=Travel.find(params[:travel_id])
    travel_detail = travel.travel_details.find(params[:id])
    travel_detail.destroy
    travel=Travel.find(params[:travel_id])
    redirect_to travel_path(travel.id)
  end

  private

  def travel_detail_params
    params.require(:travel_detail).permit(:travel_id,:travel_date,:travel_title_detail,:start_time,:finish_time,:memo)
  end

end
