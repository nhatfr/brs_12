class PerusalsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @book = Book.find params[:book_id]
    current_user.favorite @book
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @book = @perusal.book
    current_user.unfavorite @book
    respond_to do |format|
      format.js
    end
  end
end
