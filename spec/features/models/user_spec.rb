require "rails_helper"
RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:user){FactoryGirl.create :user}
  let(:other_user){FactoryGirl.create :user}

  describe "database schema" do
    it {should have_db_column(:id).of_type(:integer).with_options(null: false)}
    it {should have_db_column(:email).of_type(:string).with_options(null: false)}
    it {should have_db_column(:role).of_type(:integer).with_options(null: false)}
  end

  describe "associations" do
    it {should have_many(:reviews).dependent(:destroy)}
    it {should have_many(:activities).dependent(:destroy)}
    it {should have_many(:active_relationships).class_name("Relationship")
                         .dependent(:destroy)}
    it {should have_many(:passive_relationships).class_name("Relationship")
                         .dependent(:destroy)}
    it {should have_many(:following).through(:active_relationships)}
    it {should have_many(:followers).through(:passive_relationships)}
  end

  describe "model attributes" do
    it {should respond_to(:email)}
    it {should respond_to(:encrypted_password)}
    it {should respond_to(:role)}
    it {should respond_to(:reset_password_token)}
    it {should respond_to(:reset_password_sent_at)}
    it {should respond_to(:sign_in_count)}
  end

  describe "virtual attributes" do
    it {should respond_to(:password)}
    it {should respond_to(:password_confirmation)}
  end

  describe "instance method" do
    it {should respond_to(:follow)}
    it {should respond_to(:unfollow)}
    it {should respond_to(:favorite)}
    it {should respond_to(:unfavorite)}
  end
end
