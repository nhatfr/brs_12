class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find params[:user_id]
    @perusals = @user.perusals
  end
end
