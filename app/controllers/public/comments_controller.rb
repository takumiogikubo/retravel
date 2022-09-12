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
    comment=Comment.find(params[:id])
    if comment.customer != current_customer
      redirect_to new_travel_comment_path
    else
      comment.destroy
      redirect_to new_travel_comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:travel_id, :customer_id, :review)
  end

end
