class Public::CustomersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
    # @travels= @customer.travels.all
    @travels=@customer.travels.where(open:true)
    # @travels2=@customer.travels.where(open:false)
    if @customer.id == current_customer.id
      redirect_to customers_my_page_path
    end
  end

  def mypage
    @customer=Customer.find(current_customer.id)
    @travels= @customer.travels.all
    @travels1=@customer.travels.where(open:true)
    @travels2=@customer.travels.where(open:false)
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
