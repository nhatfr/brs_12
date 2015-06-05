class ReviewsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to @review.book
  end

  def show
    @comment = @review.comments.new
  end

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
