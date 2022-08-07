class Public::CustomersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
    # @travels= @customer.travels.all
    @travels=@customer.travels.where(open:true)
    # @travels2=@customer.travels.where(open:false)
    if customer_signed_in?
      if @customer.id == current_customer.id
        redirect_to customers_my_page_path
      end
    end
  end

  def mypage
    @customer=Customer.find(current_customer.id)
    @travels= @customer.travels.all
    @travels1=@customer.travels.where(open:true)
    @travels2=@customer.travels.where(open:false)
  end

  def edit
    @customer=Customer.find(current_customer.id)
  end

  def update
    customer=Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customers_my_page_path
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

  def followings
    @customer =Customer.find(params[:id])
    @customers =@customer.followings
  end

  def followers
    @customer =Customer.find(params[:id])
    @customers =@customer.followers
  end

  def good
    @travels=current_customer.travels.where(open:true)
  end


  private

  def customer_params
    params.require(:customer).permit(:name,:account,:email,:self_introduction)
  end

end
