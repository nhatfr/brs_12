class Relationship < ActiveRecord::Base
  include ActivityLogs
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create :log_action_follow
  before_destroy :log_action_unfollow

  private
  def log_action_follow
    create_activity Activity.actions[:follow], followed_id, follower_id
  end

  def log_action_unfollow
    create_activity Activity.actions[:unfollow], followed_id, follower_id
  end
end
