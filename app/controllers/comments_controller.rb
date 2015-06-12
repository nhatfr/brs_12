class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @review = Review.find params[:review_id]
    @comment = @review.comments.build comment_params
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @comment.errors.full_messages,
                            status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
      format.json {head :no_content}
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end
end
