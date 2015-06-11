class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments

  validates :thesis_statement, presence: true
  validates :content, presence: true

  before_save {self.thesis_statement = thesis_statement.upcase}

  scope :order_by_created_at, -> {order created_at: :DESC}
end
