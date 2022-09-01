class Admin::TravelsController < ApplicationController

  def index
    @travels=Travel.all
  end

  def show
    @travel = Travel.find(params[:id])
    @travel_details=@travel.travel_details.order("travel_date").order("start_time")
  end

  def destroy
    travel = Travel.find(params[:id])
    travel.destroy
    redirect_to  admin_travels_path
  end

end
