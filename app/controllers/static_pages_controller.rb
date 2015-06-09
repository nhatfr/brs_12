class StaticPagesController < ApplicationController
  def home
    @books = Book.all.paginate page: params[:page], per_page: Settings.per_page
  end
end
