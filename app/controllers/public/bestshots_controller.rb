class Public::BestshotsController < ApplicationController

  def new
    @travel=Travel.find(params[:travel_id])
    @bestshot=@travel.bestshots.build
  end

  def create
  end

  def edit
    @travel=Travel.find(params[:travel_id])
    @bestshot=@travel.bestshots.find(params[:id])
  end

  def update
    travel=Travel.find(params[:travel_id])
    bestshot = travel.bestshots.find(params[:id])
    bestshot.update(bestshot_params)
    travel=Travel.find(params[:travel_id])
    redirect_back fallback_location: root_path
  end

  def destroy
  end


end