class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true

  scope :order_by_created_at, -> {order created_at: :DESC}
end
