class Public::TravelsController < ApplicationController

  def index
  end

  def new
    @travel=Travel.new
    @travel_details=TravelDetail.all
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
