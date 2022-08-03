class Public::CommentsController < ApplicationController

  def new
    @travel=Travel.find(params[:travel_id])
    @comment=@travel.comments.build
    @comments=@travel.comments.all
  end

  def create
    travel=Travel.find(params[:travel_id])
    comment = travel.comments.build(comment_params)
    comment.customer = current_customer
    comment.travel_id = travel.id
    comment.save
    redirect_to new_travel_comment_path
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id,:review)
  end

end
