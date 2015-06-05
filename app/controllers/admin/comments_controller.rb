class Admin::CommentsController < ApplicationController
  load_and_authorize_resource

  def destroy
    if @comment.destroy
      flash[:success] = t :success
    else
      flash[:fail] = t :fail
    end
    redirect_to @comment.review.book
  end

end
