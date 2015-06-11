class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = review.comments.build comment_params
    if @comment.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to @review.book
  end

  def destroy
    if @comment.destroy
      flash[:success] = t :success
    else
      flash[:fail] = t :fail
    end
    redirect_to @comment.review.book
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id, :user_id
  end
end
