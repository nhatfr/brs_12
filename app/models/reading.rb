class Reading < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  enum status: [:reading, :read]

  scope :order_by_created_at, -> {order created_at: :DESC}
  scope :reading_list, ->user {where user: user, status: Settings.statuses.reading}
  scope :read_list, ->user {where user: user, status: Settings.statuses.read}
end
