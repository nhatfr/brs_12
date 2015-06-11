class Comment < ActiveRecord::Base
  include ActivityLogs

  belongs_to :user
  belongs_to :review

  validates :content, presence: true

  after_create :log_action_comment
  before_destroy :log_action_delete_comment

  private
  def log_action_comment
    create_activity Activity.actions[:comment], review_id, user_id
  end

  def log_action_delete_comment
    create_activity Activity.actions["delete comment"], review_id, user_id
  end
end
