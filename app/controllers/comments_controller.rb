class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_comments_path(@comment.item)
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show"
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], item_id: params[:item_id])
    if comment.user.id != current_user.id
      redirect_to item_path(comment.item)
    end
    comment.destroy
    redirect_to item_path(comment.item)
  end

  private
  def comment_params
    params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end