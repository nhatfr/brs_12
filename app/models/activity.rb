class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy

  enum action: Settings.actions
  
  def target
    if self.follow? || self.unfollow?
      User.find target_id
    end
  end
end
