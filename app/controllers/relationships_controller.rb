class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find params[:id]
    current_user.unfollow @user
    respond_to do |format|
      format.js
    end
  end
end
