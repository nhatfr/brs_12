class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @books = @books.order_by_created_at
                   .paginate page: params[:page],
                             per_page: Settings.books_per_page_size
  end

end
