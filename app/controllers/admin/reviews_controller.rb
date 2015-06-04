class Admin::ReviewsController < ApplicationController
  def destroy
    @review = Review.find params[:id]
    @review.destroy
    flash[:success] = t :success
    redirect_to @review.book
  end

  private
  def review_params
    params.require(:review).permit :content, :book_id
  end
end
