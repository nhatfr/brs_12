require "rails_helper"

RSpec.describe BooksController, type: :controller do
  before do
    3.times {FactoryGirl.create :book}
  end

  describe "GET index" do
    it do
      get :index
      expect(response).to render_template :index
    end

    it do
      get :index
      expect(response.status).to eq(200)
    end

    context "ransack search by title" do
      let!(:book1) {FactoryGirl.create :book}
      10.times {FactoryGirl.create :book}

      it do
        @book = Book.ransack(title_cont: "#{book1.title}").result
        @book.include? book1
      end
    end
  end

  describe "GET show" do
    before do 
      get :show, id: 1
    end

    context " render template correctly" do
      it {should render_template :show}
    end

    context "have http status success" do
      it {should respond_with(200)}
    end
  end

  describe "Routing" do
    it do
      should route(:get, "/books").
      to(controller: :books, action: :index)
    end

    it do
      should route(:get, "/books/1").to("books#show", id: 1)
    end
  end
end
