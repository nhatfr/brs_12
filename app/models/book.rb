class Book < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :book_users, dependent: :destroy
end
