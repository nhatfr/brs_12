class Book < ActiveRecord::Base
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :perusals, dependent: :destroy

  validates :title, presence: true

  scope :order_by_created_at, -> {order created_at: :DESC}
  scope :random_books, -> {limit(Settings.number_of_random_books).order("RANDOM()")}

  mount_uploader :picture, PictureUploader
  ratyrate_rateable Settings.rate.content, Settings.rate.design
end
