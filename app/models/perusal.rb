class Perusal < ActiveRecord::Base
  include ActivityLogs
  belongs_to :user
  belongs_to :book

  before_save :log_action_favorite_a_book
  before_destroy :log_action_unfavorite_a_book

  private
  def log_action_favorite_a_book
    create_activity Activity.actions[:favorite], book_id, user_id
  end

  def log_action_unfavorite_a_book
    create_activity Activity.actions[:unfavorite], book_id, user_id
  end
end
