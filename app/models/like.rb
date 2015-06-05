class Like < ActiveRecord::Base
  include ActivityLogs

  belongs_to :user
  belongs_to :activity

  before_save :log_action_like_activity
  before_destroy :log_action_unlike_activity

  private
  def log_action_like_activity  
    create_activity Activity.actions[:like], activity_id, user_id
  end

  def log_action_unlike_activity
    create_activity Activity.actions[:unlike], activity_id, user_id
  end
end
