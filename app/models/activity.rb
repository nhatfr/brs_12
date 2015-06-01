class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :like_unlikes, dependent: :destroy

  enum action: Settings.actions
end
