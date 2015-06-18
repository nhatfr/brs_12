require "rails_helper"

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:book){FactoryGirl.create :book}
  subject{book}
  

  describe "database schema" do
    it {should have_db_column(:id).of_type(:integer).with_options(null: false)}
    it {should have_db_column(:title).of_type(:string).with_options(null: true)}
    it {should have_db_column(:publication_date).of_type(:datetime)}
    it {should have_db_column(:author).of_type(:string)}
    it {should have_db_column(:number_of_pages).of_type(:integer)}
    it {should have_db_column(:rating).of_type(:float)}
    it {should have_db_column(:ISBN).of_type(:string)}
    it {should have_db_column(:description).of_type(:string)}
    it {should have_db_column(:picture).of_type(:string)}
    it {should have_db_index(:category_id)}
  end

  describe "associations" do
    it {should have_many(:reviews).dependent(:destroy)}
    it {should have_many(:perusals).dependent(:destroy)}
    it {should belong_to(:category)}
  end

  describe "model attributes" do
    it {should respond_to :title}
    it {should respond_to :author}
    it {should respond_to :ISBN}
    it {should respond_to :category_id}
  end

  describe "validations" do
    context "for title" do
      it {should validate_presence_of(:title)}
      it {should_not allow_value(" ").for (:title)}
    end
  end
end
