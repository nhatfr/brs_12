class Admin::ReviewsController < ApplicationController
  load_and_authorize_resource

  def destroy
    if @review.destroy
      flash[:success] = t :success
    else
      flash[:fail] = t :fail
    end
    redirect_to @review.book
  end

  private
  def review_params
    params.require(:review).permit :content, :book_id
  end
end
