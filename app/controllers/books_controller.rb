class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @book = Book.search(params[:book_search], search_key: :book_search)
              
    @books = @book.result(distinct: true)
                .paginate page: params[:page], per_page: Settings.paginate.per_page
  end

  def show
    @review = @book.reviews.new
    @reviews = Review.order_by_created_at
                     .paginate page: params[:page],
                               per_page: Settings.reviews_per_page
  end
end
