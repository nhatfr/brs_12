class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :require_login, only: [:index, :show]

  def index
    @users = @users.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @following  = @user.following
    @followers = @user.followers
  end

  private
  def require_login
    user_signed_in?
  end
end