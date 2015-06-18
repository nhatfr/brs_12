require "rails_helper"

RSpec.describe "books/index", type: :view do
  context "display book detail correctly" do
    let(:book) {FactoryGirl.create :book}

    it do
      render "books/book.html.erb", book: book
    end

    it do
      @search = Book.ransack params[:q]
      render "books/search"
    end
  end
end
