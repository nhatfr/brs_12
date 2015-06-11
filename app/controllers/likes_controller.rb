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
    @activity = Activity.find params[:id]
    current_user.unlike @activity
    respond_to do |format|
      format.js
    end
  end
end
