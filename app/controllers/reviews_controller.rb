class ReviewsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @review.user = current_user
    if @review.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to @review.book
  end

  def update
    if @review.save
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to review.book
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
    params.require(:review).permit :thesis_statement, :content, :book_id
  end
end
