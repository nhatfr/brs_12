class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    review = Review.find params[:review_id]
    @comment = review.comments.build comment_params
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to review.book
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
    params.require(:comment).permit :content
  end
end
