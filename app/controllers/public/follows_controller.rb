class Public::FollowsController < ApplicationController
  before_action :set_customer

  def create
    @customer = Customer.find(params[:follow][:relationship_id])
    following = current_customer.follow(@customer)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @customer
    end
  end

  def destroy
    @customer = Customer.find(params[:follow][:relationship_id])
    following = current_customer.unfollow(@customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @customer
    end
  end

  private

  def

  end

end
