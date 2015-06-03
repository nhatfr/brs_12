class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to @review.book
  end

  def destroy
    @review.destroy
    flash[:success] = t :success
    redirect_to @review.book
  end

  private

  def review_params
    params.require(:review).permit :content, :book_id
  end
end
