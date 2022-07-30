class Public::TravelDetailsController < ApplicationController

  def new
    @travel_detail=TravelDetail.new
  end

  def create
    travel_detail = TravelDetail.new(travel_detail_params)
    travel_detail.save
    redirect_to new_travel_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def travel_detail_params
    params.require(:travel_detail).permit(:travel_date,:travel_title_detail,:start_time,:finish_time,:memo)
  end

end
