class ReviewsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @review.user = current_user
    @book = @review.book
    respond_to do |format|
      if @review.save
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @review.errors.full_messages,
                            status: :unprocessable_entity}
      end
    end
  end

  def edit
    @book = @review.book
  end

  def update
    if @review.update! review_params
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to @review.book
  end

  def destroy
    @book = @review.book
    @review.destroy
    respond_to do |format|
      format.js
      format.json {head :no_content}
    end
  end

  private
  def review_params
    params.require(:review).permit :thesis_statement, :content, :book_id
  end
end
