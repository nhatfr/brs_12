class Admin::BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @books = @books.order_by_created_at
                   .paginate page: params[:page],
                             per_page: Settings.books_per_page_size
  end

  def show
    @reviews = Review.order_by_created_at
                     .paginate page: params[:page],
                               per_page: Settings.reviews_per_page
  end

  def new
  end

  def create
    respond_to do |format|
      if @book.save
        format.json {head :no_content}
        format.html {redirect_to admin_books_url}
        format.js
      else
        format.json {render json: @book.errors.full_messages,
                            status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @book.update! book_params
        format.json {head :no_content}
        format.html {redirect_to admin_books_url}
        format.js
      else
        format.json {render json: @book.errors.full_messages,
                            status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to admin_books_url}
      format.json {head :no_content}
    end
  end

  private
  def book_params
    params.require(:book).permit :title, :author, :description, :picture
  end
end
