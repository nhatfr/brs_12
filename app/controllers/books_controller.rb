class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Book.search(params[:book_search], search_key: :book_search)
    
    @books = @search.result(distinct: true).order_by_created_at
               .paginate page: params[:page],
                         per_page: Settings.paginate.per_page
  end

  def show
    @review = @book.reviews.new
    @reviews = Review.order_by_created_at
                     .paginate page: params[:page], per_page: Settings.reviews_per_page
  end
end
