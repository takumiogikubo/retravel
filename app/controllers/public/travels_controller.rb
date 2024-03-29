class Public::TravelsController < ApplicationController

  def index
    if params[:travel_title].present?
      if params[:destination].present?
        @travels = Travel.where("travel_title LIKE ? ", "%#{params[:travel_title]}%").where(destination:"#{params[:destination]}").where(open:true)
      else
        @travels = Travel.where("travel_title LIKE ? ", "%#{params[:travel_title]}%").where(open:true)
      end
    else
      if params[:destination].present?
        @travels = Travel.where(destination:"#{params[:destination]}").where(open:true)
      else
        @travels=Travel.where(open:true)
      end
    end
  end

  def show
    @travel = Travel.find(params[:id])
    # @travel_details=@travel.travel_details.where(travel_id:params[:id])
    @travel_details=@travel.travel_details.order("travel_date").order("start_time")
    # @comments=@travel.comments.where(travel_id:params[:id])

    if @travel.customer != current_customer
      unless @travel.open
        redirect_to root_path
      end
    end

  end

  def new
    @travel=Travel.new
    # @travel_details=current_customer.travel_details.all
  end

  def create
    travel = Travel.new(travel_params)
    travel.customer_id = current_customer.id
    if  travel.save
    # current_customer.travel_details.destroy_all
      redirect_to customers_my_page_path
    else
      redirect_to new_travel_path
    end
  end

  def bestshot
    @travel = Travel.find(params[:id])
    if @travel.customer != current_customer
     redirect_to travel_path(@travel)
    end

  end

  def imageupdate
    travel = Travel.find(params[:id])
    unless params[:travel]

      redirect_back fallback_location: root_path
    else
      travel.update(travel_params)
      redirect_back fallback_location: root_path
    end
  end


  def edit
    @travel = Travel.find(params[:id])
    if @travel.customer != current_customer
      redirect_to travel_path(@travel)
    end
    # @travel_details=current_customer.travel_details.all
  end

  def update
    travel = Travel.find(params[:id])
    travel.update(travel_params)
    redirect_to customers_my_page_path
  end

  def destroy
    travel = Travel.find(params[:id])
    if @travel.customer != current_customer
      redirect_to travel_path(@travel)
    else
      travel.destroy
      redirect_to  customers_my_page_path
    end
  end

  def search

  end

  private

  def travel_params
    params.require(:travel).permit(:image,:travel_detail_id,:travel_start,:travel_finish,:travel_title,:destination,:open)
  end



end
