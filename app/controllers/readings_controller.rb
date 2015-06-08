class ReadingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find params[:book_id]
    current_user.read @book, params[:behaviour]
    respond_to do |format|
      format.js
    end
  end

  def update
    @book = Book.find params[:book_id]
    current_user.read @book, params[:behaviour]
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @book = Book.find params[:book_id]
    current_user.unread @book
    respond_to do |format|
      format.js
    end
  end
end
