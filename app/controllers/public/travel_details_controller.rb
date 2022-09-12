class Public::TravelDetailsController < ApplicationController

  def new
    @travel=Travel.find(params[:travel_id])
    @travel_detail=@travel.travel_details.build
    if @travel.customer != current_customer
      redirect_to travel_path(@travel)
    end
  end

  def create
    travel=Travel.find(params[:travel_id])
    travel_detail = travel.travel_details.build(travel_detail_params)
    if travel_detail.save
      @travel=Travel.find(params[:travel_id])
      redirect_to travel_path(@travel.id)
    else
      @travel=Travel.find(params[:travel_id])
      redirect_to new_travel_travel_detail_path(@travel)
    end
  end

  def edit
    @travel=Travel.find(params[:travel_id])
    @travel_detail=@travel.travel_details.find(params[:id])
    if @travel.customer != current_customer
      redirect_to travel_path(@travel)
    end
  end

  def update
    travel=Travel.find(params[:travel_id])
    travel_detail = travel.travel_details.find(params[:id])
    if travel_detail.update(travel_detail_params)
      travel=Travel.find(params[:travel_id])
      redirect_to travel_path(travel.id)
    else
      redirect_to edit_travel_travel_detail_path(travel.id,travel_detail.id)
    end
  end

  def destroy
    travel=Travel.find(params[:travel_id])
    travel_detail = travel.travel_details.find(params[:id])
    if @travel.customer != current_customer
      redirect_to travel_path(travel.id)
    else
      travel_detail.destroy
      travel=Travel.find(params[:travel_id])
      redirect_to travel_path(travel.id)
    end
  end

  private

  def travel_detail_params
    params.require(:travel_detail).permit(:travel_id,:travel_date,:travel_title_detail,:start_time,:finish_time,:memo)
  end

end
