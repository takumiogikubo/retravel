class Public::TravelsController < ApplicationController

  def index
  end

  def show
    @travel = Travel.find(params[:id])
    @travel_details=@travel.travel_details.where(travel_id:params[:id])
  end

  def new
    @travel=Travel.new
    # @travel_details=current_customer.travel_details.all
  end

  def create
    travel = Travel.new(travel_params)
    travel.customer_id = current_customer.id
    travel.save
    # current_customer.travel_details.destroy_all
    redirect_to customers_my_page_path
  end

  def edit
    @travel = Travel.find(params[:id])
    # @travel_details=current_customer.travel_details.all
  end

  def update
    travel = Travel.find(params[:id])
    travel.update(travel_params)
    redirect_to customers_my_page_path
  end

  def destroy
    travel = Travel.find(params[:id])
    travel.destroy
    redirect_to  customers_my_page_path
  end

  private

  def travel_params
    params.require(:travel).permit(:travel_detail_id,:travel_start,:travel_finish,:travel_title,:destination,:open)
  end

end
