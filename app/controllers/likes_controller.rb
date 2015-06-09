class LikesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @activity = Activity.find params[:activity_id]
    current_user.like @activity
    respond_to do |format|
      format.js
      format.html
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @activity = @like.activity
    @like.destroy
    respond_to do |format|
      format.js
      format.html
    end
  end
end
