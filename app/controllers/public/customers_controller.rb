class Public::CustomersController < ApplicationController

  def show
    @customer=Customer.find(current_customer.id)
    @travels=Travel.all
  end

  def edit
  end

  def update
  end

  def unsubscrib
  end

  def withdraw
    @customer=Customer.find(current_customer.id)
    @customer.update(is_active: true)
    reset_session
    flash[:notic]="退会処理を実行致しました。"
    redirect_to root_path
  end

  def follow
  end

  def follower
  end

  def good
  end

end
