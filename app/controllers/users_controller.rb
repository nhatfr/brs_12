class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @following  = @user.following
    @followers = @user.followers
  end
end
