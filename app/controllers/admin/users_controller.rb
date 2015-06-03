class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t :success
    else
      flash[:danger] = t :fail
    end
    redirect_to admin_users_path
  end
end
